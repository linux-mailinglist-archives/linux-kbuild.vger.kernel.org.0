Return-Path: <linux-kbuild+bounces-10697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DDD3BEFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 07:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DADF04ED1A3
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 06:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2786536655E;
	Tue, 20 Jan 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VKwJlkN4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33813635E;
	Tue, 20 Jan 2026 06:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768889330; cv=none; b=DLhJiZ2FS0jvOhTkvaiN5CMcFDCmI9GA+CNZT/gtH7wSXDTZZqo31oa195yM5YZq1sIRyVjaWnGVUdJ74AeclZ7X4FZt5U9IVV43K1p+76fcbs8xvSqtdehFWDqT+KZYBzpjI1QyUFcgv3pY5JokV6pT5yHZ2w5OPG0bA0EU4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768889330; c=relaxed/simple;
	bh=zocH3ac6Qd/x0Nxgu322XoJVFfqafjMQ36Tf48Yj3IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG1YRqki0BHl/lP5nu6Lm1L4X9zknOcuBD0e4uru6pregajk5kZw4fNkA3D1DglSI/FP/LMs1ZT8svqcwlU7g1W2HGyA8I9V1UlMGeVLZImgcbh850vMn+Bi3NkfPOGm18UhNt+7TxNrOrFc5R13vh/Z1AY7Iy6WmtuR3Ibn0zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VKwJlkN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3EFC16AAE;
	Tue, 20 Jan 2026 06:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768889328;
	bh=zocH3ac6Qd/x0Nxgu322XoJVFfqafjMQ36Tf48Yj3IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKwJlkN4UiqfGdETU8HJW/j8YOaXH8QbBkxnTwHDeB0vi1MW++Rn/0o/HBi8GE7MH
	 3JEfbULZ+CUl9tOa3K34I+6OarKChBndtBKnPcuJQTmo+ulWjmBy7AOg6gzX33TxCC
	 E2LD4MFKqudHvFDPBGnqUHl4Gn7ofcxxvUtnaD5M=
Date: Tue, 20 Jan 2026 07:08:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 00/14] Add SPDX SBOM generation tool
Message-ID: <2026012009-applied-napped-42e2@gregkh>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
 <2026011916-idealism-paternal-cfd5@gregkh>
 <2026011938-varying-rinsing-63c6@gregkh>
 <eec88937-2afd-45cc-bf7c-28b383e27d5b@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eec88937-2afd-45cc-bf7c-28b383e27d5b@tngtech.com>

On Mon, Jan 19, 2026 at 09:08:14PM +0100, Luis Augenstein wrote:
> > Also, I don't know if this is even possible, or you care about it, but
> > if you have ANY sbom file present, it is not regenerated:
> > [...]
> > So, if I change the build config, which will change the sbom output,
> > will the sbom be regenerated?
> > Should it depend on the config .h files to know this?
> 
> Thanks for pointing this out.
> Yes, we can add the following to the Makefile dependencies to ensure the
> SBOM is regenerated when the build changes:
> - $(objtree)/$(KBUILD_IMAGE)
> - $(objtree)/include/generated/autoconf.h
> - $(objtree)/modules.order (if CONFIG_MODULES is set)
> 
> This should cover most changes.
> When you mentioned "config .h files," did you have any other specific
> files in mind that should be included as dependencies?

I was referring to the autoconf.h file, thanks for figuring that out, I
couldn't remember what the exact name was.  So that should be sufficient
here.

thanks,

greg k-h

