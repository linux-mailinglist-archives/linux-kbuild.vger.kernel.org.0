Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACC33B68AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jun 2021 20:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbhF1Ssa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Jun 2021 14:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbhF1Ssa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Jun 2021 14:48:30 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62107C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Jun 2021 11:46:04 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] builddeb: make deb building more flexible
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1624905962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ad+y4NYVGUP4DmaIe9Mgm6B506z2H8orpViIQf/cfWc=;
        b=gModoi7pk6FO/RrQ41S5ZI7uKbEQEaQyu9OgtOT04y7fmFgt9k3oMMZCMD9JMQSkQAtZVO
        3VzfbmI4dXWpM3ebd/95Uju7qv5K6xDWdVpFUiKzqxJxnfVYYJa18Qfbenu06f7KPRrALx
        wx6wLy5sucxNQcH7cWv6nyjDh6SlroFebT4BBrwp3O8T2Z+3hNeaNpf8aVpmi+JuxmVYAR
        4bYCPuXt10SMbLnGM04Rg2NJsHJk6NXAEincz6H49xlNTAK16DgskOVUc01JShlCJUP0+O
        5E0to4zlbxIsuxNNJ7NS5fnbXxEefjfplXMhs2nWV9v5j8P/pM8/IOwR31DlLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1624905962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ad+y4NYVGUP4DmaIe9Mgm6B506z2H8orpViIQf/cfWc=;
        b=9t9Bzk4VkDvnH/M9mDbkvYHdjQ6rVufyDLt3AeKyBwlBn65U8LoE5m6Qo7+bhW9A6hFT+X
        wp/C/lGJ+GCt2cBw==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org
References: <20210525230139.6165-1-bage@linutronix.de>
From:   Bastian Germann <bage@linutronix.de>
Message-ID: <0b0539d8-fbcc-b488-ed75-39cdb5ff66c4@linutronix.de>
Date:   Mon, 28 Jun 2021 20:46:01 +0200
MIME-Version: 1.0
In-Reply-To: <20210525230139.6165-1-bage@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE-frami
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Am 26.05.21 um 01:01 schrieb bage@linutronix.de:
> From: Bastian Germann <bage@linutronix.de>
> 
> Building Debian packages via the [bin]deb-pkg make targets has some
> shortcomings. These targets do not allow for packing a Debian source
> package independently from actually building the binary package.
> 
> This series improves that process by making it possible to rebuild
> the packages without errors via dpkg-buildpackage, by separating
> source package creation from binary package building, and by making
> the dbg package build optional.
> 
> Changelog v2:
>    * Drop "use standard format for copyright file" (equivalent available)
>    * Enable parallel builds (via ordered make target dependencies)
>    * Include previously excluded top-level files in tarball
>    * Other minor suggestions by Masahiro
> 
> Bastian Germann (5):
>    builddeb: ignore or export files for clean pkg build
>    builddeb: set CC on cross build to prefixed gcc
>    builddeb: clean generated package content
>    builddeb: introduce profile excluding the dbg pkg
>    kbuild: introduce srcdeb-pkg target
> 
>   scripts/Makefile.package | 11 +++++++++--
>   scripts/package/mkdebian | 13 ++++++++++++-
>   2 files changed, 21 insertions(+), 3 deletions(-)

Gentle ping after a month without reply.
