Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 489F3186CD4
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2020 15:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731288AbgCPOJ4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 10:09:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731254AbgCPOJ4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:09:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 739572071C;
        Mon, 16 Mar 2020 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584367795;
        bh=vFvUiDg0TqTQhetpQUmap+C03m80Z77YOf/E3h/BVfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FJ5dggJgeVgnSh5IqkzaHGljar1RJsDVPk4dUOxNVoUxuJ/KV+PQbjFNzWF8x8a/N
         cPFEgFAWcldftjgcdMOOvbZk7+WCA1Mi60lkyJLNw3pcwIL1Kgb58zRMafrvFiTjS6
         mvAl9QuL0PHuzwTFD8PHo7jo8mPzLLMnjIC2WcBg=
Date:   Mon, 16 Mar 2020 15:07:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Petr Malat <oss@malat.biz>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        x86@kernel.org, terrelln@fb.com, clm@fb.com, keescook@chromium.org
Subject: Re: [PATCH 1/2] lib: add support for ZSTD-compressed kernel
Message-ID: <20200316140726.GA4041840@kroah.com>
References: <20200316135025.7579-1-oss@malat.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316135025.7579-1-oss@malat.biz>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 16, 2020 at 02:50:24PM +0100, Petr Malat wrote:
> Add support for extracting ZSTD-compressed kernel images, as well as
> ZSTD-compressed initramfs.
> 
> Signed-off-by: Petr Malat <oss@malat.biz>

That says _what_ you did here, but not _why_ you did this, or why anyone
would even want this.

thanks,

greg k-h
