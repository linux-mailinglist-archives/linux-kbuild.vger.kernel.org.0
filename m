Return-Path: <linux-kbuild+bounces-9966-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 938ADCA18DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 21:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FB76300B83D
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 20:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4D027707;
	Wed,  3 Dec 2025 20:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGbXmK48"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D0398F88;
	Wed,  3 Dec 2025 20:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764793648; cv=none; b=cX6C2bIna9cFVvhpD1z3h45PU+bBdCRqPGEg6muJhU/YEw9cAh/Nm8EPeqcBV+5Vf9/Bl44qyNxDIj9hJ5CN70iTRI2ps8b0h0vlBYFoooKy+sZh2EgNRZjCkR6njbj/wrpXFRyya8PwQM5UJBUFhWbeIVUmOtwmDhhpiVQg+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764793648; c=relaxed/simple;
	bh=YtqooKhsYBrg4sYxme5XWWx7XdlPQEBX2B2+A4DR7YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChA3UBT6XWprgX7rT5DCVBhVo2HEK9nYV9zKFX4ARxRA3gZGcnUVRCJ3ru1jKrK8lWZEpJWwlegssetbz4BhNzHmhcKRb0lisuK0mKytxyzRmcG1oEVRSmsqsms/V7Z2cLJ4n+JMdy+zEahBQUgehePaWkhYld0E6l2sAo7A0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGbXmK48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A593BC4CEF5;
	Wed,  3 Dec 2025 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764793647;
	bh=YtqooKhsYBrg4sYxme5XWWx7XdlPQEBX2B2+A4DR7YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGbXmK48LGiBBCGveFNykoHduqMwhikqIIEMhQoAaXNGqRAQJDSd0W9lDbkLM8Px1
	 kQw1xC4CpHVzGz7r6pnG6U0cSUh5GR7ka9BgQBVFkOib0pIJsxhdkHYcT3XwifYPzd
	 nrVUJ68K1QN80H2/7KKqvNN/dl43A+lV7/tC+6q+L2F+FS7nWg/0fdajrHIj05tN54
	 dz0q36USlopIn++rQO/AdTf7V/XH7phjSQLTJFGLxikfHMVCwBv6WE0UM7G8GC+wRY
	 RDiXoXdMNMbEWqdI2tQSkQ38K1xfqrbghH5STkeNLyR/0NgZHHnQQPGwN4IKsXWAEa
	 AJXe25qXn7qng==
Date: Wed, 3 Dec 2025 13:27:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nsc@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, abhishekpandit@chromium.org,
	masahiroy@kernel.org, legion@kernel.org, hughd@google.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: Re: [PATCH v3] mcb: Add missing modpost build support
Message-ID: <20251203202721.GA3060476@ax162>
References: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
 <20251202203421.GB1959956@ax162>
 <2025120340-clubbing-stash-a933@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025120340-clubbing-stash-a933@gregkh>

On Wed, Dec 03, 2025 at 09:07:02AM +0100, Greg KH wrote:
> On Tue, Dec 02, 2025 at 01:34:21PM -0700, Nathan Chancellor wrote:
> > On Tue, Dec 02, 2025 at 09:42:00AM +0100, Jose Javier Rodriguez Barbarin wrote:
> > > mcb bus is not prepared to autoload client drivers with the data defined on
> > > the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> > > inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
> > > 
> > > Add modpost build support for accessing to the mcb_table_id coded on device
> > > drivers' MODULE_DEVICE_TABLE.
> > > 
> > > Fixes: 3764e82e5150 ("drivers: Introduce MEN Chameleon Bus")
> > > Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> > > Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> > > ---
> > 
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > 
> > We should be able to get this to Linus by 6.19-rc1.
> 
> Why?  What's the rush?

I was going off of Andy's previous comments about getting this into a
6.19-rc release to allow Jose to send the follow up changes for removing
MODULE_ALIAS from the drivers that use mcb_device_id, which are spread
out across the tree.

  https://lore.kernel.org/CAHp75VfhM5GuYY1qUKgBhePDo4oe5k3K1ZDTPbYJNr5NtjVVfQ@mail.gmail.com/
  https://lore.kernel.org/aS3YUYtrEn39lUPl@smile.fi.intel.com/

That could be -rc2 or -rc3 obviously but -rc1 is objectively the most
compatible base for all maintainer trees.

> It should have been in -next already to get into -rc1.

This seems like a low risk change, maybe even a borderline fix (and it
would still be in -next before it went to Linus). I do not have to push
it that quickly though, I have no strong opinion on the priority of this
change. Another option would be a shared branch after -rc1 is out that
other trees could pull in so that those changes could go into 6.20 and
get proper -next soak time.

Cheers,
Nathan

