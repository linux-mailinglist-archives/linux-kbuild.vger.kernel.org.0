Return-Path: <linux-kbuild+bounces-1148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32786FE3D
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 11:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADBB280EEC
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 10:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E16B1B95F;
	Mon,  4 Mar 2024 10:01:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F368C18EAD
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709546499; cv=none; b=IL/zNUtgFVEe4hRsV13CtItNkt5Cx5Dt58VDJXtRWxrndaSQ7YbyGYqQ+B0FKjn6yKNKyydJT9y9cg0p+C3Fc9kUfzeK85IgGOVpp8fuJVPwUZIX35Jk/htAqfMisf+Rtj+oGGZQO4CqYI2QOYZrklF3nqY541aqGu4A/Y6wUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709546499; c=relaxed/simple;
	bh=v8wC0JSzfU8o1qTpJU1GKd1rgABzCOqxMJWjYUWd4Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz11u2fCy6hQOlzunDkrtW2duvh9t0pDTXZtEH5HwXdKjKrEFJpNQpp6rPI3sWxDDDwTrMDuWQxYbcC+oU1aw7KZmheXVw056U0UBAhxgVdyLXlWwr2fL5gF4XwSMW6phLSJSl0sOJOj4E+CU8wC2eNT6l38JhoqW9gGEAt7UpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  4 Mar 2024 11:01:24 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id A77818014B;
	Mon,  4 Mar 2024 11:01:24 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 9A1B7180D0E; Mon,  4 Mar 2024 11:01:24 +0100 (CET)
Date: Mon, 4 Mar 2024 11:01:24 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 01/30] build: replace uses of $(abspath ) with
 existing variables
Message-ID: <ZeWb9EaO4WhcgEEs@buildd.core.avm.de>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <2173c7fa03e24291f2f59423d77a3cb175317688.1709508290.git.ehem+linux@m5p.com>
 <ZeWZebwyvtuJ6Xd1@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZeWZebwyvtuJ6Xd1@buildd.core.avm.de>
X-purgate-ID: 149429::1709546484-0B7C4E5D-B96EB519/0/0
X-purgate-type: clean
X-purgate-size: 867
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Mon, Mar 04, 2024 at 10:50:49AM +0100, Nicolas Schier wrote:
> On Fri, Mar 01, 2024 at 12:51:01PM -0800, Elliott Mitchell wrote:
> > As $(abs_objtree) and $(abs_srctree) already exist, $(abspath )
> > shouldn't be used with $(objtree) or $(srctree).
> > 
> > Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output does not exist")
> > Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
> > ---
> > I believe this is pretty much all fixes, but 0e1aa629f1ce was the most
> > recent one.
> 
> If you add a 'Fixes' trailer, please just include changes that fix that
> commit.  You're patch does much more than just modifying the changes
> from commit 0e1aa629f1ce.

oh and please do not re-use the same commit subject line for different
changes.  This will be quite confusing when reading the git history.

Kind regards,
Nicolas

