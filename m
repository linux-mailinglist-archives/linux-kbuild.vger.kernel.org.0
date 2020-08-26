Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F31A2539A9
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 23:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgHZVVw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 17:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgHZVVw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 17:21:52 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8C3C061574;
        Wed, 26 Aug 2020 14:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Xsfx+KabYUh+DH5+P2LawgczRML7gRo0hmmmop5VVHQ=; b=JcmJGGf2yA5/kdHpckUJrt/PTG
        1AeBqLH5ZuPIzzV1aSlS+fpiw8WWJwvaOthEnyoxDSElm7nPQwKTnSmk+guFm+BdgXHG2jmgM3evD
        Dju/YtKirQ0VMCl8l35SNVWt/7qtd34/1EGYbh7eit5LmnRIUEqYXm1UraOVYVuWGn0tsnCsLkXAn
        ZXneyhuQvgKZrwETjYgKiuDzI37JZuAWjiL3MwlK0loltDVfDKbYbgxX0ZldCW7euUHWETtKmBbG1
        MTJNw+2Y29RMafHfIbtLtK36zkJK5euVtlgt9Vo/8IeNl4qxx1mcdwdxJU4Fw/jdZIGHCUFRgU3CI
        Dxq70WLA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kB2rb-00013Y-4X; Wed, 26 Aug 2020 21:21:47 +0000
To:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Changbin Du <changbin.du@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kconfig: streamline_config.pl: check defined(ENV variable)
 before using it
Message-ID: <be80ceda-596b-03aa-394f-166cc6388aa0@infradead.org>
Date:   Wed, 26 Aug 2020 14:21:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

A user reported:
'Use of uninitialized value $ENV{"LMC_KEEP"} in split at
 ./scripts/kconfig/streamline_config.pl line 596.'

so first check that $ENV{LMC_KEEP} is defined before trying
to use it.

Fixes: c027b02d89fd ("streamline_config.pl: add LMC_KEEP to preserve some kconfigs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Changbin Du <changbin.du@gmail.com>
Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20200825.orig/scripts/kconfig/streamline_config.pl
+++ linux-next-20200825/scripts/kconfig/streamline_config.pl
@@ -593,7 +593,10 @@ while ($repeat) {
 }
 
 my %setconfigs;
-my @preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
+my @preserved_kconfigs;
+if (defined($ENV{'LMC_KEEP'})) {
+	@preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
+}
 
 sub in_preserved_kconfigs {
     my $kconfig = $config2kfile{$_[0]};

