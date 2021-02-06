Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C8F311D31
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 13:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhBFMwI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 07:52:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:59986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhBFMwB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:52:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5588C64E51;
        Sat,  6 Feb 2021 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612615879;
        bh=AORe1C1FgufUmxGHE8kmERM4XeV9DFN2ZMIr96e/da0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H3HCITLMpWBWh58ZMCKqRvicga/qWEIkmys3i95V+B6UgEw7aV1bYcxXzcFVLIl7+
         q7LmtHIzylzU3NdVPc83cNDBZJuK/3WB8oNjtyuuclhPhCXuY6Myl7BV16EfKxHNUX
         qAUWwNqbdbLD4OZH8CfJW5Wlo2VvYqRD0YtM2TLk=
Date:   Sat, 6 Feb 2021 13:51:17 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org
Subject: Re: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
Message-ID: <YB6QxWgfBnGSexyW@kroah.com>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206035033.2036180-2-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 10:50:32PM -0500, Sasha Levin wrote:
> Right now if SUBLEVEL becomes larger than 255 it will overflow into the
> territory of PATCHLEVEL, causing havoc in userspace that tests for
> specific kernel version.
> 
> While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
> SUBLEVEL at any point as ABI changes don't happen in the context of
> stable tree.
> 
> Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
> the context of LINUX_VERSION_CODE. This does not affect "make
> kernelversion" and such.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
