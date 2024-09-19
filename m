Return-Path: <linux-kbuild+bounces-3623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D257597CA5C
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 15:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C86F1F24648
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 13:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D3A19DFA6;
	Thu, 19 Sep 2024 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="T+ioQNxi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4D19D074;
	Thu, 19 Sep 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753620; cv=none; b=nnWAq7MhytD+KBQqoCc25wXvfATq3fVz3j2qR36S1HTpLxJESbq1YCxbE+gQneNvZENGsjvX0tgkuit+ewfqLC7vkPvDwMQIwydlkdoQS1v4l51SLjwFHwObCMSxQ36SUyNOKrOAKFq+qH1s3DzCqmKnwLL2f+OSXZXUrvXGZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753620; c=relaxed/simple;
	bh=bBCKrBP/m9jzUH0l4n1n4F5b11X1RLN15QJFdMW5NeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN+LYXo0eNbQYP9CrB1GpJgKLunNgHZFOG61YBb3CjPQ/EvN7YY/bcVGKC5VdhowAVzNgF5cwswX4R5IDAwrVBMdPvxOkvyVbzB8S3pcRRCVBBC7179u08XgM2vqzYo4RkESoMllcfWDfoYCJw3Mypv+fC+dJEm5JvmgG4mjPtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=T+ioQNxi; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726753614; bh=bBCKrBP/m9jzUH0l4n1n4F5b11X1RLN15QJFdMW5NeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+ioQNxiZw0ZZOJcXacLdeTbAZzoXATCCdgmR35JHq4Vx3lg4YyJJdNUqV49mpSYP
	 fVp22rrFv1HDSgM1gRUaPziZT2PNhZOryoupjaMJPuOpK742yITnIx/5UUGrirzwUh
	 a6vUT/bKH5aMFlM/DC5BxGcK6df8hsFVgQcxaVf0=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 19 Sep 2024 15:46:53 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 8CB6C805CA;
	Thu, 19 Sep 2024 15:46:53 +0200 (CEST)
Date: Thu, 19 Sep 2024 15:46:52 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 07/23] kbuild: remove unnecessary prune of rust/alloc for
 rustfmt
Message-ID: <ZuwrTJftLlWNtrFs@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-8-masahiroy@kernel.org>
 <ZuwJlaeFfo7CW5dC@l-nschier-nb>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZuwJlaeFfo7CW5dC@l-nschier-nb>
X-purgate-ID: 149429::1726753613-54DB9BF0-A91DD983/0/0
X-purgate-type: clean
X-purgate-size: 548
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Thu, Sep 19, 2024 at 01:23:01PM +0200, Nicolas Schier wrote:
> On Tue, Sep 17, 2024 at 11:16:35PM +0900, Masahiro Yamada wrote:
> > Commit 9d0441bab775 ("rust: alloc: remove our fork of the `alloc`
> > crate") removed the rust/alloc/ directory.
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > 
> >  Makefile | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Reviewed-by: Nicolas Schier <n.schier@avm.de>

oh, there is still a comment about 'rust/alloc' in Makefile that
probably wants to be removed, too.

