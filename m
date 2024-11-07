Return-Path: <linux-kbuild+bounces-4538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EB9BFE3F
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 07:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739C4B21D2C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 06:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6EA192D75;
	Thu,  7 Nov 2024 06:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XayEa1Lb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97FCBE4A;
	Thu,  7 Nov 2024 06:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959982; cv=none; b=u236XT3MfbAavZKpVmkCX4kp30rWBVKY+hF9gAdP6PzStLVbfML/lIZt/8b39EhKIMTTN7Co3ID6CZTS9CDWGArJ3PZ9XHDY7AeeeSV/SvMhba1cPhmsaETD7jaciPhUFVm8CIXxbDQQS2De0B8pArce+zFBnJo3eW+6UsdO8NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959982; c=relaxed/simple;
	bh=Zu/0om6BkgwUpVU6oA8Y0ELiMCWQnb6yM+Zkjgxxwuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0siE2sW7c4hqmzVxfqgG2qdCyXydL5re+QHEw6e6oRi6sAXTw3lcQSlzRkeTufX8Vgmi095jjUAjbnk7vJNWoGHTkUQVVuVvEG4tFo3e78DTRjBRpAl3K4kQjF887H5P/FpQcOMxCtU+1dLnOAmr/wT/08MI0FRk/Am298X/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XayEa1Lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A16C4CECD;
	Thu,  7 Nov 2024 06:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730959981;
	bh=Zu/0om6BkgwUpVU6oA8Y0ELiMCWQnb6yM+Zkjgxxwuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XayEa1LbMPjBlTS5OPZ5nhNLt9HxwPa1ETUlBgdqFJLFW+bc7Xzk0F8bNDznS8JXa
	 y3wdNLsOaFhBUkFGAi5IHZcKLDlpPdLCawws0qApHRsJV3GHs0LOmTrvNkeFUdbUcL
	 RvhfVGeNtNfz8v0cU+NuibGj94wcMiYd3GDFk5x4=
Date: Thu, 7 Nov 2024 07:12:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <2024110716-skimmer-dreary-54ef@gregkh>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106190240.GR10375@noisy.programming.kicks-ass.net>

On Wed, Nov 06, 2024 at 08:02:40PM +0100, Peter Zijlstra wrote:
> Hi,
> 
> I've been wanting $topic for a while, and having just stumbled into the
> whole namespace thing by accident, I figured I'd give it a go, most if
> the hard parts seem to have already been done.
> 
> It reserves and disallows imports on any "MODULE_${name}" namespace,
> while it implicitly adds the same namespace to every module.
> 
> This allows exports targeted at specific modules and no others -- one
> random example included. I've hated the various kvm exports we've had
> for a while, and strictly limiting them to the kvm module helps
> alleviate some abuse potential.

Very nice!  I like it too, no objection from me, should make it easier
to clean up a lot of stuff.

greg k-h

