
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/17/2015 13:02:35
-- Generated from EDMX file: E:\NewAvalonTracker\Avalon-Tracker\AvalonTracker\AvalonTracker\AvalonModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AvalonTest4];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PartyQuest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_PartyQuest];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestVoteQuest_QuestVote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QuestVoteQuest] DROP CONSTRAINT [FK_QuestVoteQuest_QuestVote];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestVoteQuest_Quest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QuestVoteQuest] DROP CONSTRAINT [FK_QuestVoteQuest_Quest];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestPartyVote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyVotes] DROP CONSTRAINT [FK_QuestPartyVote];
GO
IF OBJECT_ID(N'[dbo].[FK_GameActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivePlayers] DROP CONSTRAINT [FK_GameActivePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyActivePlayer_Party]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyActivePlayer] DROP CONSTRAINT [FK_PartyActivePlayer_Party];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyActivePlayer_ActivePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyActivePlayer] DROP CONSTRAINT [FK_PartyActivePlayer_ActivePlayer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[PartyPlayers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartyPlayers];
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
IF OBJECT_ID(N'[dbo].[ActivePlayers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActivePlayers];
GO
IF OBJECT_ID(N'[dbo].[Games]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games];
GO
IF OBJECT_ID(N'[dbo].[QuestVoteQuest]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuestVoteQuest];
GO
IF OBJECT_ID(N'[dbo].[PartyActivePlayer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartyActivePlayer];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PartyPlayers'
CREATE TABLE [dbo].[PartyPlayers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PartyLeaderId] int  NOT NULL,
    [ActivePlayerId] int  NOT NULL,
    [QuestId] int  NOT NULL
);
GO

-- Creating table 'Quests'
CREATE TABLE [dbo].[Quests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Stage] int  NOT NULL,
    [VoteTrack] int  NOT NULL
);
GO

-- Creating table 'QuestVotes'
CREATE TABLE [dbo].[QuestVotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PassFlag] bit  NOT NULL
);
GO

-- Creating table 'PartyVotes'
CREATE TABLE [dbo].[PartyVotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ApproveFlag] bit  NOT NULL,
    [ActivePlayerId] int  NOT NULL,
    [Quest_Id] int  NOT NULL
);
GO

-- Creating table 'Player'
CREATE TABLE [dbo].[Player] (
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

-- Creating table 'ActivePlayers'
CREATE TABLE [dbo].[ActivePlayers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PlayerId] int  NOT NULL,
    [Game_Id] int  NOT NULL
);
GO

-- Creating table 'Games'
CREATE TABLE [dbo].[Games] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] nvarchar(max)  NULL
);
GO

-- Creating table 'QuestVoteQuest'
CREATE TABLE [dbo].[QuestVoteQuest] (
    [QuestVotes_Id] int  NOT NULL,
    [QuestVoteQuest_QuestVote_Id] int  NOT NULL
);
GO

-- Creating table 'PartyActivePlayer'
CREATE TABLE [dbo].[PartyActivePlayer] (
    [PartyActivePlayer_ActivePlayer_Id] int  NOT NULL,
    [PartyActivePlayer_Party_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'PartyPlayers'
ALTER TABLE [dbo].[PartyPlayers]
ADD CONSTRAINT [PK_PartyPlayers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
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

-- Creating primary key on [Id] in table 'PartyVotes'
ALTER TABLE [dbo].[PartyVotes]
ADD CONSTRAINT [PK_PartyVotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
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

-- Creating primary key on [Id] in table 'ActivePlayers'
ALTER TABLE [dbo].[ActivePlayers]
ADD CONSTRAINT [PK_ActivePlayers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [PK_Games]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [QuestVotes_Id], [QuestVoteQuest_QuestVote_Id] in table 'QuestVoteQuest'
ALTER TABLE [dbo].[QuestVoteQuest]
ADD CONSTRAINT [PK_QuestVoteQuest]
    PRIMARY KEY CLUSTERED ([QuestVotes_Id], [QuestVoteQuest_QuestVote_Id] ASC);
GO

-- Creating primary key on [PartyActivePlayer_ActivePlayer_Id], [PartyActivePlayer_Party_Id] in table 'PartyActivePlayer'
ALTER TABLE [dbo].[PartyActivePlayer]
ADD CONSTRAINT [PK_PartyActivePlayer]
    PRIMARY KEY CLUSTERED ([PartyActivePlayer_ActivePlayer_Id], [PartyActivePlayer_Party_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [QuestVotes_Id] in table 'QuestVoteQuest'
ALTER TABLE [dbo].[QuestVoteQuest]
ADD CONSTRAINT [FK_QuestVoteQuest_QuestVote]
    FOREIGN KEY ([QuestVotes_Id])
    REFERENCES [dbo].[QuestVotes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [QuestVoteQuest_QuestVote_Id] in table 'QuestVoteQuest'
ALTER TABLE [dbo].[QuestVoteQuest]
ADD CONSTRAINT [FK_QuestVoteQuest_Quest]
    FOREIGN KEY ([QuestVoteQuest_QuestVote_Id])
    REFERENCES [dbo].[Quests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestVoteQuest_Quest'
CREATE INDEX [IX_FK_QuestVoteQuest_Quest]
ON [dbo].[QuestVoteQuest]
    ([QuestVoteQuest_QuestVote_Id]);
GO

-- Creating foreign key on [Quest_Id] in table 'PartyVotes'
ALTER TABLE [dbo].[PartyVotes]
ADD CONSTRAINT [FK_QuestPartyVote]
    FOREIGN KEY ([Quest_Id])
    REFERENCES [dbo].[Quests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestPartyVote'
CREATE INDEX [IX_FK_QuestPartyVote]
ON [dbo].[PartyVotes]
    ([Quest_Id]);
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

-- Creating foreign key on [PartyActivePlayer_ActivePlayer_Id] in table 'PartyActivePlayer'
ALTER TABLE [dbo].[PartyActivePlayer]
ADD CONSTRAINT [FK_PartyActivePlayer_Party]
    FOREIGN KEY ([PartyActivePlayer_ActivePlayer_Id])
    REFERENCES [dbo].[PartyPlayers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PartyActivePlayer_Party_Id] in table 'PartyActivePlayer'
ALTER TABLE [dbo].[PartyActivePlayer]
ADD CONSTRAINT [FK_PartyActivePlayer_ActivePlayer]
    FOREIGN KEY ([PartyActivePlayer_Party_Id])
    REFERENCES [dbo].[ActivePlayers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyActivePlayer_ActivePlayer'
CREATE INDEX [IX_FK_PartyActivePlayer_ActivePlayer]
ON [dbo].[PartyActivePlayer]
    ([PartyActivePlayer_Party_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------