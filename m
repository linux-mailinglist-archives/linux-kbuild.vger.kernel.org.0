Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6335A122D2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 14:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfLQNmj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 08:42:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:39874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727962AbfLQNmi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 08:42:38 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1AB220717;
        Tue, 17 Dec 2019 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576590158;
        bh=gJ8rVUCztw8szvbFFB6ChRg1w1nBW7WHuA2nM6G+gEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/7OlukgjIYXWMiAYP+RpVQ09G0T4Q8OBkrDufcj6C3MhUQI7k0M+is1IKfT6hRuI
         g+L3m5nUdyPYYnXvzPiYC7JW4JgcPFiWzKaewa/LFUhaA01Z3O1LIihKH/z5/Ibwkp
         aNNCv2Zl4a/r5cDzC7vNR3oAxLTd8Cg2HRo59PNI=
Date:   Tue, 17 Dec 2019 14:42:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jiri Slaby <jslaby@suse.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: vt: move conmakehash to drivers/tty/vt/ from
 scripts/
Message-ID: <20191217134236.GA3365333@kroah.com>
References: <20191217110633.8796-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217110633.8796-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 17, 2019 at 08:06:33PM +0900, Masahiro Yamada wrote:
> scripts/conmakehash is only used for generating
> drivers/tty/vt/consolemap_deftbl.c
> 
> Move it to the related directory.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/tty/vt/.gitignore                 | 1 +
>  drivers/tty/vt/Makefile                   | 6 ++++--
>  {scripts => drivers/tty/vt}/conmakehash.c | 0
>  scripts/.gitignore                        | 1 -
>  scripts/Makefile                          | 3 ---
>  5 files changed, 5 insertions(+), 6 deletions(-)
>  rename {scripts => drivers/tty/vt}/conmakehash.c (100%)

I thought we wanted scripts to be in the scripts directory :)

Anyway, this is fine, I'll take it in my tree.

thanks,

greg k-h
