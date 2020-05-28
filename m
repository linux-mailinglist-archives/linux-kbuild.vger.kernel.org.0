Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76591E68B3
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2020 19:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405589AbgE1Rek (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 May 2020 13:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405041AbgE1Rei (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 May 2020 13:34:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA56DC08C5C6;
        Thu, 28 May 2020 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=4NdQPXiGDixOac6odaLZpaKeHwDqQiLCg9d5gMfwitA=; b=OtrKgaVabU9dshlSL2ah+NMvpj
        P/E2tv8DAG9LEQ/A9rfJekihp466NZCR8qKnzZkZlFl0jsAR/07+K/34A0p85riFpDGZB9Pn+ewMy
        SKALxjKuSPFxZ1dmpi8scQ4O3Ez6mjixP2R2t9InyAbxT4LAV3/XIGacW8UkDfsx1pMTNCirM/Lby
        SyXp12aASXMlQjEYbmFE1nDLtmfLkdlJFkM2Z+PRJeCiJ55dpWK+m0wxYQFJzRyOQgAInezcmjs3Q
        4FjTrFhZgIytfI1qJDSjbWmB2cY7KAiB7i71erW34gXXZ5ERAm/Zw/QskVU4bbdvte7Ki9pR2r3j/
        VI7/SosQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jeMQN-0005CN-U7; Thu, 28 May 2020 17:34:35 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] kbuild: modpost: fix a message typo
Message-ID: <085ad1e6-f9a1-06ee-c8f1-7ac6b6ae8552@infradead.org>
Date:   Thu, 28 May 2020 10:34:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix typo/spello:

WARNING: modpost: Symbol dump file is missing. Modules may not have dependencies or movversions.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/mod/modpost.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200528.orig/scripts/mod/modpost.c
+++ linux-next-20200528/scripts/mod/modpost.c
@@ -2600,7 +2600,7 @@ int main(int argc, char **argv)
 		read_symbols_from_files(files_source);
 
 	if (missing_dump_file)
-		warn("Symbol dump file is missing. Modules may not have dependencies or movversions.\n");
+		warn("Symbol dump file is missing. Modules may not have dependencies or modversions.\n");
 
 	/*
 	 * When there's no vmlinux, don't print warnings about

