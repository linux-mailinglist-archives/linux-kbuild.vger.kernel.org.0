Return-Path: <linux-kbuild+bounces-8416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DFFB23BF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 00:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D18F626FBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 22:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983C7202C5D;
	Tue, 12 Aug 2025 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wY/nEQYL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8672A1B2;
	Tue, 12 Aug 2025 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755038107; cv=none; b=CFzwGNwU31tr/y25Okfdy171qNHcssrbTmNC84brpKxwAqybfjKk1b3HsnWdg0YRWEotRKAkYbuMQNctgsLTDnIhcIaV3LlwqhSOWTHUAmLR49pApvAFNgWL1ApmvsSXCpMRFAvW5UjHc2PLs6w8ueokFlWlnuCE8yLC6g999iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755038107; c=relaxed/simple;
	bh=JOvOvagIe67ABYGy6BhEc1L3UU4ePTBysXYTRPqBA/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4KFjWOQekidH1iNyjQSELFRVHdJrk7svpKnptf8PCxrMOMoV6rrH/ADi+YpBBV+MUgmO7+fQt5CaZTeNw+HCX24qWN9rLpzCUYkeVnf+hhfA2UC2KPAsvuxCBsHqZUP89V04wn8lUteUxjRxy8PSzHmqQNnGe9e093dbPeF0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wY/nEQYL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+EEI7yK6XojmomNRzKfQjOSdi05xxiTDf/TrM9DIwLg=; b=wY/nEQYLWfmZV65rZDU0tvPxe/
	mtuEEHdD6Bp90o2B9+c9C0SBEMR4WHyzY9Y2FsFdfD9AQaqAw0Gzr01AAX60YVBZIKyDtF+CpjhHA
	nvlGj0QcDO3D7Vvn4eV6csaZHYt0q4F6miG69KN5Nd3dZpUlvkik75KyqmXQ9UTl4KplVAH7A8O/7
	058/0DZbn0tSdsRxfpfkorQtJ91NHf2+vhUs6cOW65Y08RAHBqjw+pOkyUUudxLtV3EDZcfSP5zSG
	X5DLFXC+9Bfa6hl+RvzOP0ofSdJWfhcg0s5Ozl3cSFt8G6k5zD7MCifl87lnNK+OFyAo3xc67eCGc
	WU9Rl3gQ==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulxaB-0000000CA2Y-1DcU;
	Tue, 12 Aug 2025 22:35:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] kconfig: qconf/xconfig: show the OptionsMode radio button setting at startup
Date: Tue, 12 Aug 2025 15:35:02 -0700
Message-ID: <20250812223502.1356426-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When qconf (xconfig) exits, it saves the current Option settings
for Show Name, Show Debug Info, and Show {Normal|All|Prompt} Options.
When it is next run, it loads these Option settings from its
config file. It correctly shows the flag settings for Show Name
and Show Debug Info, but it does not show which of the 3 Show...Options
is set. This can lead to confusing output, e.g., if the user thinks
that xconfig is in Show All Options mode but kconfig options which
have an unmet dependency are still being listed.

Add code to show the radio button for the current Show...Options
mode during startup so that it will reflect the current config
setting.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Nathan, Nicolas: do you want me to ask someone else to merge this?
  I don't mind doing that;
  or throw it into your tree and see what breaks.

I know next to nothing about the Qt toolkit, so any comments or
testing are appreciated. There could easily be a better fix for this.
Thanks.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 scripts/kconfig/qconf.cc |   13 +++++++++++++
 1 file changed, 13 insertions(+)

--- linux-next-20250807.orig/scripts/kconfig/qconf.cc
+++ linux-next-20250807/scripts/kconfig/qconf.cc
@@ -1377,6 +1377,19 @@ ConfigMainWindow::ConfigMainWindow(void)
 	ConfigList::showPromptAction = new QAction("Show Prompt Options", optGroup);
 	ConfigList::showPromptAction->setCheckable(true);
 
+	switch (configList->optMode) {
+	case allOpt:
+		ConfigList::showAllAction->setChecked(true);
+		break;
+	case promptOpt:
+		ConfigList::showPromptAction->setChecked(true);
+		break;
+	case normalOpt:
+	default:
+		ConfigList::showNormalAction->setChecked(true);
+		break;
+	}
+
 	QAction *showDebugAction = new QAction("Show Debug Info", this);
 	  showDebugAction->setCheckable(true);
 	connect(showDebugAction, &QAction::toggled,

