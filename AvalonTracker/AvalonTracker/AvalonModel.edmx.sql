
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/16/2015 19:16:52
-- Generated from EDMX file: E:\NewAvalonTracker\Avalon-Tracker\AvalonTracker\AvalonTracker\AvalonModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AvalonDB];
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
IF OBJECT_ID(N'[dbo].[FK_GameActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivePlayers] DROP CONSTRAINT [FK_GameActivePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Players] DROP CONSTRAINT [FK_PlayerActivePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_ActivePlayerPartyVote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivePlayers] DROP CONSTRAINT [FK_ActivePlayerPartyVote];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivePlayers] DROP CONSTRAINT [FK_PartyActivePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyVoteParty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyVotes] DROP CONSTRAINT [FK_PartyVoteParty];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ActivePlayers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActivePlayers];
GO
IF OBJECT_ID(N'[dbo].[Parties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parties];
GO
IF OBJECT_ID(N'[dbo].[Quests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Quests];
GO
IF OBJECT_ID(N'[dbo].[Games]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games];
GO
IF OBJECT_ID(N'[dbo].[QuestVotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuestVotes];
GO
IF OBJECT_ID(N'[dbo].[PartyVotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartyVotes];
GO
IF OBJECT_ID(N'[dbo].[Players]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players];
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

-- Creating table 'ActivePlayers'
CREATE TABLE [dbo].[ActivePlayers] (
    [PlayerId] int IDENTITY(1,1) NOT NULL,
    [GameId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Game_Id] int  NOT NULL,
    [Player_Id] int  NOT NULL,
    [PartyVotes_PlayerId] int  NOT NULL,
    [PartyVotes_PartyId] int  NOT NULL,
    [PartyVotes_QuestId] int  NOT NULL,
    [Party_Id] int  NOT NULL
);
GO

-- Creating table 'Parties'
CREATE TABLE [dbo].[Parties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quests_Id] int  NOT NULL
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

-- Creating table 'Games'
CREATE TABLE [dbo].[Games] (
    [Id] int IDENTITY(1,1) NOT NULL
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
    [Parties_Id] int  NOT NULL
);
GO

-- Creating table 'Players'
CREATE TABLE [dbo].[Players] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
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

-- Creating primary key on [PlayerId], [GameId] in table 'ActivePlayers'
ALTER TABLE [dbo].[ActivePlayers]
ADD CONSTRAINT [PK_ActivePlayers]
    PRIMARY KEY CLUSTERED ([PlayerId], [GameId] ASC);
GO

-- Creating primary key on [Id] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [PK_Parties]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Quests'
ALTER TABLE [dbo].[Quests]
ADD CONSTRAINT [PK_Quests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [PK_Games]
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

-- Creating primary key on [Id] in table 'Players'
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [PK_Players]
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

-- Creating foreign key on [Game_Id] in table 'ActivePlayers'
ALTER TABLE [dbo].[ActivePlayers]
ADD CONSTRAINT [FK_GameActivePlayer]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[Games]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameActivePlayer'
CREATE INDEX [IX_FK_GameActivePlayer]
ON [dbo].[ActivePlayers]
    ([Game_Id]);
GO

-- Creating foreign key on [Player_Id] in table 'ActivePlayers'
ALTER TABLE [dbo].[ActivePlayers]
ADD CONSTRAINT [FK_PlayerActivePlayer]
    FOREIGN KEY ([Player_Id])
    REFERENCES [dbo].[Players]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerActivePlayer'
CREATE INDEX [IX_FK_PlayerActivePlayer]
ON [dbo].[ActivePlayers]
    ([Player_Id]);
GO

-- Creating foreign key on [PartyVotes_PlayerId], [PartyVotes_PartyId], [PartyVotes_QuestId] in table 'ActivePlayers'
ALTER TABLE [dbo].[ActivePlayers]
ADD CONSTRAINT [FK_ActivePlayerPartyVote]
    FOREIGN KEY ([PartyVotes_PlayerId], [PartyVotes_PartyId], [PartyVotes_QuestId])
    REFERENCES [dbo].[PartyVotes]
        ([PlayerId], [PartyId], [QuestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ActivePlayerPartyVote'
CREATE INDEX [IX_FK_ActivePlayerPartyVote]
ON [dbo].[ActivePlayers]
    ([PartyVotes_PlayerId], [PartyVotes_PartyId], [PartyVotes_QuestId]);
GO

-- Creating foreign key on [Party_Id] in table 'ActivePlayers'
ALTER TABLE [dbo].[ActivePlayers]
ADD CONSTRAINT [FK_PartyActivePlayer]
    FOREIGN KEY ([Party_Id])
    REFERENCES [dbo].[Parties]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyActivePlayer'
CREATE INDEX [IX_FK_PartyActivePlayer]
ON [dbo].[ActivePlayers]
    ([Party_Id]);
GO

-- Creating foreign key on [Parties_Id] in table 'PartyVotes'
ALTER TABLE [dbo].[PartyVotes]
ADD CONSTRAINT [FK_PartyVoteParty]
    FOREIGN KEY ([Parties_Id])
    REFERENCES [dbo].[Parties]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyVoteParty'
CREATE INDEX [IX_FK_PartyVoteParty]
ON [dbo].[PartyVotes]
    ([Parties_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------