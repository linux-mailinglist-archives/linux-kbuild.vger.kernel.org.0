Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8EF18770D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 01:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733171AbgCQAsh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 20:48:37 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:50358 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733005AbgCQAsh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 20:48:37 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 9CCDA1579A147;
        Mon, 16 Mar 2020 17:48:36 -0700 (PDT)
Date:   Mon, 16 Mar 2020 17:48:36 -0700 (PDT)
Message-Id: <20200316.174836.1008034012256551916.davem@davemloft.net>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, sparclinux@vger.kernel.org,
        clang-built-linux@googlegroups.com, viro@zeniv.linux.org.uk,
        ndesaulniers@google.com, ilie.halip@gmail.com,
        natechancellor@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sparc: revive __HAVE_ARCH_STRLEN for 32bit sparc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200311223725.27662-1-masahiroy@kernel.org>
References: <20200311223725.27662-1-masahiroy@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 16 Mar 2020 17:48:37 -0700 (PDT)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Mar 2020 07:37:24 +0900

> Prior to commit 70a6fcf3283a ("[sparc] unify 32bit and 64bit string.h"),
> __HAVE_ARCH_STRLEN was defined in both of string_32.h and string_64.h
> 
> It did not unify __HAVE_ARCH_STRLEN, but deleted it from string_32.h
> 
> This issue was reported by the kbuild test robot in the trial of
> forcible linking of $(lib-y) to vmlinux.
> 
> Fixes: 70a6fcf3283a ("[sparc] unify 32bit and 64bit string.h")
> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: David S. Miller <davem@davemloft.net>
