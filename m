Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B738352ABB
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Apr 2021 14:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhDBMkP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Apr 2021 08:40:15 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:59605 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhDBMkP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Apr 2021 08:40:15 -0400
Date:   Fri, 02 Apr 2021 12:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1617367211; bh=DnRWb/ENWowUkZ8iMTc38PO0CZerw5Mgien+btzdpIs=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=f2ok6exh3P/IMfzSxhSEdxRg0SrKbm4qlxRtZlo1amxNMOVigSbPpx89+eCpKjh/x
         CPLUsT38kheCkovQjvGAknk5XXH6ckD6gXapDIIr8hCZAvyxGDrK0MuU1GVZjb/28C
         wqMP8JPWVmJEcZkyQROhUobTS9yv5fQbx1YAyR9gb4f/ZlcDnJbKYGZMXPb6RrX547
         zpImCnpHuypY375B/xgiTkFfvDakg5+M6qw8M1aDHhlcD33cXrHdb1alXAxRtNOZaD
         a1NRg9xO0qo2V25OwSRkKY77Rm9J5Dk8FibIOdu933XH1s/nSaPjDcLeLqRBc+YxaW
         S+5MH+n1mpv0A==
To:     Kees Cook <keescook@chromium.org>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Jessica Yu <jeyu@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH] kbuild: merge module sections under CONFIG_LD_DEAD_CODE_DATA_ELIMINATION too
Message-ID: <20210402123959.5143-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION,
-fdata-sections and -ffunction-sections are being enabled by the
top-level Makefile, and module section merging is also needed.
Expand the ifdef (and the comment block) to cover that case too.

Fixes: 6a3193cdd5e5 ("kbuild: lto: Merge module sections if and only if CON=
FIG_LTO_CLANG is enabled")
Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 scripts/module.lds.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 2c52535f9b56..d6bbdfc55e08 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -20,11 +20,14 @@ SECTIONS {

 =09__patchable_function_entries : { *(__patchable_function_entries) }

-#ifdef CONFIG_LTO_CLANG
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CL=
ANG)
 =09/*
 =09 * With CONFIG_LTO_CLANG, LLD always enables -fdata-sections and
-=09 * -ffunction-sections, which increases the size of the final module.
-=09 * Merge the split sections in the final binary.
+=09 * -ffunction-sections. With CONFIG_LD_DEAD_CODE_DATA_ELIMINATION,
+=09 * -fdata-sections and -ffunction-sections are being enabled by
+=09 * the top-level Makefile.
+=09 * This increases the size of the final module. Merge the split
+=09 * sections in the final binary.
 =09 */
 =09.bss : {
 =09=09*(.bss .bss.[0-9a-zA-Z_]*)
--
2.31.1


