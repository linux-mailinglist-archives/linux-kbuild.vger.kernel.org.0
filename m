Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6C920EE45
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgF3GZP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:25:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgF3GZP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:25:15 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C87CD20672;
        Tue, 30 Jun 2020 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593498314;
        bh=e4GbKwWlnby3ASGFrK0feBdyKd8uOMswnUpnE6FeJaw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=zQ91PRwFvjA+TfSxAJC+9fBYwEw9ng2aB5vMhFl5inHzc8feVeTmVluIS85oHmiQ7
         flOXhcW90I2QIdJNNCa85UcqaF6EpjSRk4MozrdZqA2340Cpp8UqPMnnDGrs3YEwD6
         FdcNn09u/URgDkHDlCihidsOmZH/rMoJkE8Iaf0E=
Date:   Tue, 30 Jun 2020 08:25:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] kconfig: qconf: navigate menus on hyperlinks
Message-ID: <20200630082511.6f1f92c7@coco.lan>
In-Reply-To: <CAK7LNASbWXkRZ3OrmDSXj4jfu6jGcMnjnOOJ4+cV22fweJ9OJA@mail.gmail.com>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
        <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
        <CAK7LNASbWXkRZ3OrmDSXj4jfu6jGcMnjnOOJ4+cV22fweJ9OJA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Tue, 30 Jun 2020 12:36:27 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Mon, Jun 29, 2020 at 6:35 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Instead of just changing the helper window to show a
> > dependency, also navigate to it at the config and menu
> > widgets.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---  
> 
> 
> I noticed a regression.
> 
> Visit "Networking support",
> and click "select: BPF"
> from the window at the bottom.
> 
> Nothing happens except the following error message
> in the console:
> 
> Clicked menu is invalid: ^BPF$
> 
> 
> If I apply only 1-4 in this series,
> this works fine.

Hmm... perhaps this is related to symbol visibility. If the clicked
link is not visible, it won't be able to present the Kconfig option.

I guess we can implement a mixed approach here: update just the
configInfo data if it can't find the clicked item as a menu, like
the enclosed patch.

I'll send an updated version with this hybrid approach.

Thanks,
Mauro

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f49fbac91995..fd721c6c4c94 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1263,10 +1263,13 @@ void ConfigInfoView::clicked(const QUrl &url)
 		    break;
 	}
 
-	if (!m)
-		qInfo() << "Clicked menu is invalid:" << data;
-	else
+	if (!m) {
+		/* Symbol is not visible as a menu */
+		symbolInfo();
+		emit showDebugChanged(true);
+	} else {
 		emit menuSelected(m);
+	}
 
 	free(result);
 	delete data;


