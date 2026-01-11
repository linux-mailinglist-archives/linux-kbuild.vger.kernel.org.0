Return-Path: <linux-kbuild+bounces-10483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B66D0F88C
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 18:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F5630329EF
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 17:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C742F34C830;
	Sun, 11 Jan 2026 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b="hmUb6DDs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ofcsgdbm.dwd.de (ofcsgdbm.dwd.de [141.38.3.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47D2222D1
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Jan 2026 17:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.38.3.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768153310; cv=none; b=ViW/GOwHKUHRVUmemRHJEnLYQxhF2kMBhuD1AY8ZaMG7J6S8+w9qbwewsz2nImI4CZ2JBJvKIjyIx9RQxYookBmfb4oeXlzYtau2UV86Pf9s5uNvpUFq69JZhePP6UhtMT5I4r5zlgnfJZtxTKR0kvhXGQ2FSKY6AkFS4oBhE6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768153310; c=relaxed/simple;
	bh=UXKCXGLvc9iw2HTjgchiDEAF8DC1FIot/3hn8K08QpE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jqsmoJ0WfsyYjN6Y3UBIC2RZEFAOCKKl0U1EDkLxgqqbMfXdhpWZZ4Df1veWwQWDYBS16/m/6rXTWFLPfzAg1NbewTJ9rObJ57phfqh1Zf4oatxsAVBSzyhoqC7D/Z2vSqOeTysuB1M/THe/tWDyXr3nFg+Mng9uZUfe9VcRWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de; spf=pass smtp.mailfrom=dwd.de; dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b=hmUb6DDs; arc=none smtp.client-ip=141.38.3.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dwd.de
Received: from localhost (localhost [127.0.0.1])
	by ofcsg2dn3.dwd.de (Postfix) with ESMTP id 4dq2r40Xhnz4tk0
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Jan 2026 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dwd.de; h=
	content-type:content-type:mime-version:references:message-id
	:in-reply-to:subject:subject:from:from:date:date:received
	:received:received:received:received:received:received:received;
	 s=dwd-csg20210107; t=1768153299; x=1769362900; bh=UXKCXGLvc9iw2
	HTjgchiDEAF8DC1FIot/3hn8K08QpE=; b=hmUb6DDs32Gf1quf2maNvDmjgReS/
	UIBllbRYlaf3xVmQ1ttJivn3Eyb5aXvs63SrNLmQzxsA+XuiEUE3+81cd7CT7vbU
	TGCF5Y9oTooKX0LbTWCp4GO9hEGW2L03hFmkh6akZAJQ9fwqaL1m3S+1mOQ2RH5a
	1JZRhXOB5zupIUh8+/qK/UM51Y6xulaLVQef66jp2BcgaHZv50nhcok8Qt6hhGro
	r3luZH7+VzNaJZGq1AqpVARb0AJf0F+joJ3XPPfqtWSt3r7Y1RQuOSfYefVXgswp
	+lQpyZxTb7wYSpMtZuSgf3vg/KxK7R+UX7RuNQ4MUWgUyEjgKUo2fT/7A==
X-Virus-Scanned: by amavisd-new at csg.dwd.de
Received: from ofcsg2cteh1.dwd.de ([172.30.232.65])
 by localhost (ofcsg2dn3.dwd.de [172.30.232.26]) (amavis, port 10024)
 with ESMTP id JThJfu94Rwk2 for <linux-kbuild@vger.kernel.org>;
 Sun, 11 Jan 2026 17:41:39 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id C3BF7C902E8E
	for <root@ofcsg2dn3.dwd.de>; Sun, 11 Jan 2026 17:41:39 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id B8886C902E66
	for <root@ofcsg2dn3.dwd.de>; Sun, 11 Jan 2026 17:41:39 +0000 (UTC)
X-DDEI-TLS-USAGE: Unused
Received: from ofcsgdbm.dwd.de (unknown [172.30.232.26])
	by ofcsg2cteh1.dwd.de (Postfix) with ESMTP
	for <root@ofcsg2dn3.dwd.de>; Sun, 11 Jan 2026 17:41:39 +0000 (UTC)
Received: from ofcsgdbm.dwd.de by localhost (Postfix XFORWARD proxy);
 Sun, 11 Jan 2026 17:41:39 -0000
Received: from ofcsg2dvf2.dwd.de (unknown [172.30.232.11])
	by ofcsg2dn3.dwd.de (Postfix) with ESMTPS id 4dq2r34zJKz4tk0;
	Sun, 11 Jan 2026 17:41:39 +0000 (UTC)
Received: from ofmailhub.dwd.de (ofldap.dwd.de [141.38.39.196])
	by ofcsg2dvf2.dwd.de  with ESMTP id 60BHfdfN005470-60BHfdfO005470;
	Sun, 11 Jan 2026 17:41:39 GMT
Received: from praktifix.dwd.de (praktifix.dwd.de [141.38.44.46])
	by ofmailhub.dwd.de (Postfix) with ESMTP id 6ADC5E190F;
	Sun, 11 Jan 2026 17:41:39 +0000 (UTC)
Date: Sun, 11 Jan 2026 18:41:39 +0100 (CET)
From: Holger Kiehl <Holger.Kiehl@dwd.de>
To: Nicolas Schier <nsc@kernel.org>
cc: linux-kernel <linux-kernel@vger.kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
    Uday Shankar <ushankar@purestorage.com>
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
In-Reply-To: <aWLF4BwQemwIZMMp@levanger>
Message-ID: <71934f81-c412-cdaa-421b-b3b599be756d@praktifix.dwd.de>
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de> <aWFt34dkIvlu1EYI@derry.ads.avm.de> <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de> <aWLF4BwQemwIZMMp@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-FEAS-Client-IP: 141.38.39.196
X-FE-Last-Public-Client-IP: 141.38.39.196
X-FE-Policy-ID: 2:2:1:SYSTEM
X-TMASE-Version: DDEI-5.1-9.1.1004-29692.001
X-TMASE-Result: 10--12.991400-10.000000
X-TMASE-MatchedRID: 7ySqCuYCpfgMek0ClnpVp/HkpkyUphL9NUSduuqYHDtLWMri+Qqmsexl
	/JBXgQ0mgaQ6I9UEU8wv9l0GJdC16OM2fQ6STlVfrMZ+BqQt2NrzZKDA1/pIrjocBhlYvFzr/ji
	lg8PXoIs6hUOcTonr9H8mA3sDDq0AcWlAkEA3e4Nq8/xv2Um1avoLR4+zsDTthUfR2rvBju6nw5
	2XVXCkJAmyI2aXdNvCF6Vf0jVDQ4v8i5dt33x0CD/R7vuyshIstPrxAaEmNdo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-DDEI-PROCESSED-RESULT: Safe

On Sat, 10 Jan 2026, Nicolas Schier wrote:

> A simple solution might be to call modules_sign target after the
> find-debuginfo.sh run; but commit 16c36f8864e3 spunds to me as if we
> should rather do something similiar as for the Debian packages:
> modules_install with INSTALL_MOD_STRIP=1 and then install only the debug
> infos manually.
> 
> Does that make sense?
> 
I am not a kernel developer and my knowledge in this area is very
limited. Did try your suggestion to call modules_install with
INSTALL_MOD_STRIP=1, but still the signature was removed in the
RPM. Removing the 'chmod u+x', so find-debuginfo.sh does not strip
them, did not help either. But, most properly, I am still missing
something.

Kind regards,
Holger

