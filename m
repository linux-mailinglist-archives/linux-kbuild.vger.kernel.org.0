Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138FF186CD7
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2020 15:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731482AbgCPOJ7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 10:09:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731254AbgCPOJ6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:09:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC1EE20753;
        Mon, 16 Mar 2020 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584367798;
        bh=EB7VShUPlmAf0BiLwy/4NA2pZfxn04F0sDEqYs3uYuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tsEzye+Gv9NGJwbgV2b1VikBAPV92ZcbqcffX3CDpKkmIn8hqHXgdqEOI0wK+aIOH
         kFiNDAPmUo5z0sxXngZzFea5K+eroi49TRsoIwV9vtinOL9wEqXuC4/GnKPtYJ3T5M
         PIolp42B+fBPT6SN70b3R01jDo4stqCH8uzEQhtk=
Date:   Mon, 16 Mar 2020 15:07:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Petr Malat <oss@malat.biz>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        x86@kernel.org, terrelln@fb.com, clm@fb.com, keescook@chromium.org
Subject: Re: [PATCH 2/2] x86: Enable support for ZSTD-compressed kernel
Message-ID: <20200316140745.GB4041840@kroah.com>
References: <20200316135025.7579-1-oss@malat.biz>
 <20200316135025.7579-2-oss@malat.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316135025.7579-2-oss@malat.biz>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 16, 2020 at 02:50:25PM +0100, Petr Malat wrote:
> Signed-off-by: Petr Malat <oss@malat.biz>
> ---
>  arch/x86/Kconfig                  | 1 +
>  arch/x86/boot/compressed/Makefile | 5 ++++-
>  arch/x86/boot/compressed/misc.c   | 4 ++++
>  arch/x86/include/asm/boot.h       | 4 ++--
>  4 files changed, 11 insertions(+), 3 deletions(-)

I know I don't take patches without any changelog text, maybe other
maintainers are more lax...
