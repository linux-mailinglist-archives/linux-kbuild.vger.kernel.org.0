Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E51D34263C
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 20:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhCSTcl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Mar 2021 15:32:41 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:53160 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhCSTcQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Mar 2021 15:32:16 -0400
Date:   Fri, 19 Mar 2021 19:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1616182334; bh=0gYqyiW16TyPFK3ZonOwm02JDX0IoTuaJ9gN7oAEEjg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=LT0cCQX0/cBkPGRD6rjYqNv+N/KMW7G5SVqg9UhEl8+++4G78VPhjduryN/UM+xdy
         9/6Inpmn3ZEoGXni/90CpTfiCDKhuu6YFWbmOejaml3vsB80mymXAkoslQ2gGjo6XU
         y5T1z+4nEQkaukH9NWoQ3e6XbSwrB3rtd4UmLzdwV9CQROMVcsAgoqObM4nEr4of6A
         ++LNrVHqHip3oWP7Cv74gKg9uquWDUEXicqsnKMDzGVH+19XhQwBM6i7w2hNkCvlYg
         7FFscNoB7rMCTxNdXnp6sXhtaen6gzhJUOhM6KlSghsfYYpSUF1lgFAy3WKdaS5z5T
         5em/v9HwDiIfg==
To:     Masahiro Yamada <masahiroy@kernel.org>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH 0/2] kconfig: fence choices and menuconfigs with comments in .config too
Message-ID: <20210319193150.267510-1-alobakin@pm.me>
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

Comment blocks for menus are great for dotconfig readability, but
currently it's the only type (beside plain comments) of submenus
for which these block are generated.
This series expands the code to also generate such blocks for choices
and menuconfigs and additionally expands the comments themselves a
bit to let know if they belong to choice or menu{,config} block.

Alexander Lobakin (2):
  kconfig: fence choices and menuconfigs with comments in .config too
  kconfig: mention submenu type in comment blocks in .config

 scripts/kconfig/confdata.c | 43 +++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 14 deletions(-)

--
2.31.0


