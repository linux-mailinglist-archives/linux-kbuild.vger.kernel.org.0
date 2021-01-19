Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEE12FBB36
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 16:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389189AbhASPaM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 10:30:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:51650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390457AbhASP02 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 10:26:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B200E23119;
        Tue, 19 Jan 2021 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611069948;
        bh=RcQzfjdCAnOAT04s0z52kpDzbA1gQMPcX3oaJODY9+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2gQZBYLYK+bmPHHZll0YISYhWIWZeeYYkmeAMwFjVh59LBToLniIUUJacuyGbwbN+
         sfiaal5Lkhk3eImg5SPzVuqVnek8gG/7OvGlimCjiwGkYJ0IRhTLnbESR7ZZDOgres
         IoTWXMA+xt/8i7F1RECjgl8rkQ9kEqIm6uldYIKk=
Date:   Tue, 19 Jan 2021 16:25:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] kbuild: give the SUBLEVEL more room in KERNEL_VERSION
Message-ID: <YAb5+R1R74QXds3o@kroah.com>
References: <20210118195453.761623-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118195453.761623-1-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 18, 2021 at 02:54:53PM -0500, Sasha Levin wrote:
> SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> once it reaches 256.
> 
> Few of the stable branches will imminently overflow SUBLEVEL while
> there's no risk of overflowing VERSION.
> 
> Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> should create a better balance between the different version numbers we
> use.
> 
> The downside here is that Linus will have 8 bits less to play with, but
> given our current release cadence (~10 weeks), the number of Linus's
> fingers & toes (20), and the current VERSION (5) we can calculate that
> VERSION will overflow in just over 1,000 years, so I'm kicking this can
> down the road.
> 
> Cc: stable@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Looks good to me, thanks for fixing up the USB code.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
