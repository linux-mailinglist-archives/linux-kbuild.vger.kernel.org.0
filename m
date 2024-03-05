Return-Path: <linux-kbuild+bounces-1160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A919871C32
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 11:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA479B2447E
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 10:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934AF5F848;
	Tue,  5 Mar 2024 10:43:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D195EE89
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635403; cv=none; b=SC3ZMGgJ6wpIj49HYEvhbX42iejfTu3a9s0ZbrhD14Y79/EkdBs08jqYVmib46tl78o6aXaplkDMMXB4eotp1XGXTqCaTlRxeejrPQlIHGrMvOkUwrHyIr8PqNamzGkkgzhgVaOMTqqC12IN3TmLXiPKJXc83CBwcVvN+sG0Cnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635403; c=relaxed/simple;
	bh=LnXSi7eNOJfo9PIrjCrbKHZYI886Pumm65dmt4n2m1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWji+tSNwcl3LsmfVvguRLOe3rAm0/V7P9mGtyv5a5TVPZMe86mTRwCH/u8/4MRqhlH1EHIaCUubfzVqQYtHpwL0USbjqaSNRm4qaqc8mA6vgfbKiNhWovEk+1RDN8z7u8vdJ8wjZCYdWlMnCBBFLH+Bqb8cixp8kHhOV4XKB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  5 Mar 2024 11:43:06 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id C4D4080155;
	Tue,  5 Mar 2024 11:43:07 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id B87F318B48A; Tue,  5 Mar 2024 11:43:07 +0100 (CET)
Date: Tue, 5 Mar 2024 11:43:07 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
Message-ID: <Zeb3O0IaAOJHY02w@buildd.core.avm.de>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
X-purgate-ID: 149429::1709635386-037B4E5D-AE01A2F8/0/0
X-purgate-type: clean
X-purgate-size: 979
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Mon, Mar 04, 2024 at 11:36:27AM -0800, Elliott Mitchell wrote:
> On Mon, Mar 04, 2024 at 10:57:18AM +0100, Nicolas Schier wrote:
> > 
> > can you please describe a concrete problem you want to solve with your
> > patch set?  Masahiro already asked in [1], and I still don't get your
> > motivation while reading your cover letter.  It would be helpful to see
> > your goal when looking at your patches.
> 
> I'm trying to develop an alternative kernel build system for one Linux
> distribution.  Due to how other pieces of the distribution work it seems
> using the out-of-tree build mechanism to build in-tree modules may be a
> better approach.  This may be abusing the current build system, but if it
> works without breaking anything else that should be acceptable.

oh well.  You are probably aware of things like
subdir-ccflags-y and that kmods built via M= are considered to be
out-of-tree and taint the kernel.

Good luck.

Kind regards,
Nicolas

