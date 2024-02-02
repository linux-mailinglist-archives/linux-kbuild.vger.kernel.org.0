Return-Path: <linux-kbuild+bounces-765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83E846B8F
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 10:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E2CE1C26487
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0888E17BDA;
	Fri,  2 Feb 2024 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="fwcGrOJU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FCA65BA5
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Feb 2024 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865006; cv=none; b=Wd+3UGtGFKP2nnCVQm2lz1p87WEiBu3OtzUOHh/L7mSnbuRuuHFKbiJ2LY+2jt8sDI5TIvkTltWdqKKWBrExbi/FmlMLy8EoNHxViGwBU28IpTz7ahnDQmTmPXV78qdd/adYV53qyHQfN4cCKWQZMGdHLGMRcxy9e5kjielcrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865006; c=relaxed/simple;
	bh=LMmTT7GC4WSqAWqZO1Q90I9auGuSLAD2ywvlFovuW3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGpOsv2EoBM2bzIBJDUDSPP6vp0RNFhywxCh6kGHxNyTbBUZzoaoWEUDUigHKvzHiq6iOfq3l7U9fWLebmvuUT8qdjH7RxWYE1NXEJhNikdMBTtL8teRX1sxYmO58XVBmrx0Z5oA0O+iYEclYFJcoEZIC5lnOG9xEW0uB+5M2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=fwcGrOJU; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1706864673; bh=LMmTT7GC4WSqAWqZO1Q90I9auGuSLAD2ywvlFovuW3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwcGrOJUQKONGqNlvV1VXfsQUt+0T3c4dpK1TKwfDorJz7POFpM5GfrkGo6hvVINP
	 STmd64Fs4jBpVvQtQ/wFE1POSBp8dtNcKcTYA6LJbQwhlhFvfeHoppNoAFhCM3qwhw
	 rbrDVlG9qVHh7VhdEZfCmjAE37QZjmWos4SAkI6A=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  2 Feb 2024 10:04:33 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 26AA9802B0;
	Fri,  2 Feb 2024 10:04:34 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 1A98C180F92; Fri,  2 Feb 2024 10:04:34 +0100 (CET)
Date: Fri, 2 Feb 2024 10:04:34 +0100
From: Nicolas Schier <n.schier@avm.de>
To: "David F." <df7729@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Changes to kbuild in 6.x causing cpp build issues.
Message-ID: <ZbywIl-RU3xRGaj6@buildd.core.avm.de>
Mail-Followup-To: "David F." <df7729@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
 <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com>
 <CAGRSmLs9M+XAk6q=7s_aGMfjAHkTVEtYszsTsoBkSdwPoeTd9g@mail.gmail.com>
 <CAGRSmLs_7DjjZazExF+cjHCzaiRsrfKNh89au+nF-dkhQ79uwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGRSmLs_7DjjZazExF+cjHCzaiRsrfKNh89au+nF-dkhQ79uwA@mail.gmail.com>
Organization: AVM GmbH
X-purgate-ID: 149429::1706864673-F0FDFE49-0DADEA85/0/0
X-purgate-type: clean
X-purgate-size: 453
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Thu, Feb 01, 2024 at 09:51:34PM -0800, David F. wrote:
> Any help would be appreciated on how to create the *.o.cmd file for .cpp files?

Neither tested nor evaluated in-depth:
You might want to have a look at scripts/Makefile.build and
scripts/Kbuild.include.  If you are able to include the relevant kbuild
parts in your Makefile, you could try to supply a cmd_cc_o_cc definition
and use it with if_changed macro.

Kind regards,
Nicolas

