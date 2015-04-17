
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/16/2015 21:19:24
-- Generated from EDMX file: E:\NewAvalonTracker\Avalon-Tracker\AvalonTracker\AvalonTracker\AvalonModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AvalonTest2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PartyQuest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parties] DROP CONSTRAINT [FK_PartyQuest];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestVoteQuest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QuestVotes] DROP CONSTRAINT [FK_QuestVoteQuest];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestPartyVote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_QuestPartyVote];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Player] DROP CONSTRAINT [FK_PlayerActivePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_ActivePlayerPartyVote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyVotes] DROP CONSTRAINT [FK_ActivePlayerPartyVote];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parties] DROP CONSTRAINT [FK_PartyActivePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyVoteParty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyVotes] DROP CONSTRAINT [FK_PartyVoteParty];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[GameInstances]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GameInstances];
GO
IF OBJECT_ID(N'[dbo].[Parties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parties];
GO
IF OBJECT_ID(N'[dbo].[Quests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Quests];
GO
IF OBJECT_ID(N'[dbo].[QuestVotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuestVotes];
GO
IF OBJECT_ID(N'[dbo].[PartyVotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartyVotes];
GO
IF OBJECT_ID(N'[dbo].[Player]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Player];
GO
IF OBJECT_ID(N'[dbo].[Characters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Characters];
GO
IF OBJECT_ID(N'[dbo].[RevealedCharacters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RevealedCharacters];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'GameInstances'
CREATE TABLE [dbo].[GameInstances] (
    [GameId] int  NOT NULL
);
GO

-- Creating table 'Parties'
CREATE TABLE [dbo].[Parties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PartyLeaderId] int  NOT NULL,
    [Quests_Id] int  NOT NULL,
    [Game_GameId] int  NOT NULL
);
GO

-- Creating table 'Quests'
CREATE TABLE [dbo].[Quests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QuestPartyVote_Quest_PlayerId] int  NOT NULL,
    [QuestPartyVote_Quest_PartyId] int  NOT NULL,
    [QuestPartyVote_Quest_QuestId] int  NOT NULL
);
GO

-- Creating table 'QuestVotes'
CREATE TABLE [dbo].[QuestVotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PassFlag] bit  NOT NULL,
    [QuestVoteQuest_QuestVote_Id] int  NOT NULL
);
GO

-- Creating table 'PartyVotes'
CREATE TABLE [dbo].[PartyVotes] (
    [PlayerId] int IDENTITY(1,1) NOT NULL,
    [ApproveFlag] bit  NOT NULL,
    [PartyId] int  NOT NULL,
    [QuestId] int  NOT NULL,
    [ActivePlayer_GameId] int  NOT NULL,
    [Parties_Id] int  NOT NULL,
    [Parties_PartyLeaderId] int  NOT NULL
);
GO

-- Creating table 'Player'
CREATE TABLE [dbo].[Player] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [PlayerActivePlayer_Player_GameId] int  NULL
);
GO

-- Creating table 'Characters'
CREATE TABLE [dbo].[Characters] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RevealedCharacters'
CREATE TABLE [dbo].[RevealedCharacters] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [GameId] in table 'GameInstances'
ALTER TABLE [dbo].[GameInstances]
ADD CONSTRAINT [PK_GameInstances]
    PRIMARY KEY CLUSTERED ([GameId] ASC);
GO

-- Creating primary key on [Id], [PartyLeaderId] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [PK_Parties]
    PRIMARY KEY CLUSTERED ([Id], [PartyLeaderId] ASC);
GO

-- Creating primary key on [Id] in table 'Quests'
ALTER TABLE [dbo].[Quests]
ADD CONSTRAINT [PK_Quests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'QuestVotes'
ALTER TABLE [dbo].[QuestVotes]
ADD CONSTRAINT [PK_QuestVotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [PlayerId], [PartyId], [QuestId] in table 'PartyVotes'
ALTER TABLE [dbo].[PartyVotes]
ADD CONSTRAINT [PK_PartyVotes]
    PRIMARY KEY CLUSTERED ([PlayerId], [PartyId], [QuestId] ASC);
GO

-- Creating primary key on [Id] in table 'Player'
ALTER TABLE [dbo].[Player]
ADD CONSTRAINT [PK_Player]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Characters'
ALTER TABLE [dbo].[Characters]
ADD CONSTRAINT [PK_Characters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RevealedCharacters'
ALTER TABLE [dbo].[RevealedCharacters]
ADD CONSTRAINT [PK_RevealedCharacters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Quests_Id] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [FK_PartyQuest]
    FOREIGN KEY ([Quests_Id])
    REFERENCES [dbo].[Quests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyQuest'
CREATE INDEX [IX_FK_PartyQuest]
ON [dbo].[Parties]
    ([Quests_Id]);
GO

-- Creating foreign key on [QuestVoteQuest_QuestVote_Id] in table 'QuestVotes'
ALTER TABLE [dbo].[QuestVotes]
ADD CONSTRAINT [FK_QuestVoteQuest]
    FOREIGN KEY ([QuestVoteQuest_QuestVote_Id])
    REFERENCES [dbo].[Quests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestVoteQuest'
CREATE INDEX [IX_FK_QuestVoteQuest]
ON [dbo].[QuestVotes]
    ([QuestVoteQuest_QuestVote_Id]);
GO

-- Creating foreign key on [QuestPartyVote_Quest_PlayerId], [QuestPartyVote_Quest_PartyId], [QuestPartyVote_Quest_QuestId] in table 'Quests'
ALTER TABLE [dbo].[Quests]
ADD CONSTRAINT [FK_QuestPartyVote]
    FOREIGN KEY ([QuestPartyVote_Quest_PlayerId], [QuestPartyVote_Quest_PartyId], [QuestPartyVote_Quest_QuestId])
    REFERENCES [dbo].[PartyVotes]
        ([PlayerId], [PartyId], [QuestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestPartyVote'
CREATE INDEX [IX_FK_QuestPartyVote]
ON [dbo].[Quests]
    ([QuestPartyVote_Quest_PlayerId], [QuestPartyVote_Quest_PartyId], [QuestPartyVote_Quest_QuestId]);
GO

-- Creating foreign key on [PlayerActivePlayer_Player_GameId] in table 'Player'
ALTER TABLE [dbo].[Player]
ADD CONSTRAINT [FK_PlayerActivePlayer]
    FOREIGN KEY ([PlayerActivePlayer_Player_GameId])
    REFERENCES [dbo].[GameInstances]
        ([GameId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerActivePlayer'
CREATE INDEX [IX_FK_PlayerActivePlayer]
ON [dbo].[Player]
    ([PlayerActivePlayer_Player_GameId]);
GO

-- Creating foreign key on [ActivePlayer_GameId] in table 'PartyVotes'
ALTER TABLE [dbo].[PartyVotes]
ADD CONSTRAINT [FK_ActivePlayerPartyVote]
    FOREIGN KEY ([ActivePlayer_GameId])
    REFERENCES [dbo].[GameInstances]
        ([GameId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ActivePlayerPartyVote'
CREATE INDEX [IX_FK_ActivePlayerPartyVote]
ON [dbo].[PartyVotes]
    ([ActivePlayer_GameId]);
GO

-- Creating foreign key on [Game_GameId] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [FK_PartyActivePlayer]
    FOREIGN KEY ([Game_GameId])
    REFERENCES [dbo].[GameInstances]
        ([GameId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyActivePlayer'
CREATE INDEX [IX_FK_PartyActivePlayer]
ON [dbo].[Parties]
    ([Game_GameId]);
GO

-- Creating foreign key on [Parties_Id], [Parties_PartyLeaderId] in table 'PartyVotes'
ALTER TABLE [dbo].[PartyVotes]
ADD CONSTRAINT [FK_PartyVoteParty]
    FOREIGN KEY ([Parties_Id], [Parties_PartyLeaderId])
    REFERENCES [dbo].[Parties]
        ([Id], [PartyLeaderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyVoteParty'
CREATE INDEX [IX_FK_PartyVoteParty]
ON [dbo].[PartyVotes]
    ([Parties_Id], [Parties_PartyLeaderId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------