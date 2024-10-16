Return-Path: <linux-kbuild+bounces-4153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E99A1198
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 20:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CDC281AA2
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 18:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E0818BB89;
	Wed, 16 Oct 2024 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="l3HD1PDs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gD73Fl19"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A686F1494CC;
	Wed, 16 Oct 2024 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103513; cv=none; b=or4EPFWN8GGJQY+5G3zynlSu0FcUj7CKhdrpSVMDRSSNBCkqEWYwGfhtWAZyE/kAfAT7GzWZ3VDM94qq56yQoxERCHFR74H0YUsaPHGhc9OfAWp3D5qVHOcmgBbFRe7yD87bMXncVJFJQpZFIrjzy0n9Cu2bndOHwCmdDhojS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103513; c=relaxed/simple;
	bh=ikOpzjgJe3gcfyHssEJF6ZOgvgAufMIFjvvQE6QbR5s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RrxrcO+8m6mububacbv28YVDo53uXB+kXGW5Mq8cvr3nVTx7JU5phqy64wX2wnYbAUeX+ZCIzqg95wtjNwLdsQVAY9AhZ+D357agZOqVLoHnxkG3DbQJX0EIGhPrYeJmOVrWfPAnVQDwiOQEDkQZxWfxQGzPzyu96W5bHxzCOV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=l3HD1PDs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gD73Fl19; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7091A254008F;
	Wed, 16 Oct 2024 14:31:50 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 16 Oct 2024 14:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729103510;
	 x=1729189910; bh=ymGZ+F5Q+6zPxDfr5uhRuaVWQUin2zTqLDTQDUD/5PE=; b=
	l3HD1PDs+ckm9NTo6Wp3KL1YG4eDim3EXFL5O8lIlK1nvAG5maQT0GMiq7bgp0Mm
	BFxqSq7SA7wRQhD7zX+y81HI97AI1AuIqiPqj5f8DVU4j/usDnNZzqvkDzYo1FRD
	2z/5qV3iHam6oC85KTsUsIFzGQ2/DD7CSVep9e6F3C0yR6QRCn73pARXJUoVpQIX
	KGNfdASjDFap1Ap7iwQDXi3qYboF++vtB+NG2biOKEB0ztBzU+F9Far/cKI4anS+
	vUY5xjqvuElbQtdhwzJjVTvcuT4moucAvivPkPM0ZLGxTIc7NUysfLjzs1vQax+j
	u38YgMcxJQlB921nsyhZ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729103510; x=
	1729189910; bh=ymGZ+F5Q+6zPxDfr5uhRuaVWQUin2zTqLDTQDUD/5PE=; b=g
	D73Fl19tfnCBvECN06RsGbwNewsF66hmbpRs3EKqqLo4r1qltkUb46jcN5IhtUMU
	RGXH8pewTHRDNcYNDXTl4yjM8ULacslFJRboX4NCQ05hp16OlVIXXLDAP9/YP855
	zMSgCjTUrgOHB3RtjlokBMdl0Hfh5B/Fp9FF11oFOR/Ik5l8vHx6oYbx94iy/xRu
	fK3xi5G3lS2TqyXLdAuJWqIkyOk9gAU5oi+/VEJgCzXdLX5rcrm6YUnyGm9F7Gau
	JGtZ52k89IJ/VFItPBhCjmiWLXorStBoKz9Q22JeP2+bsQqRcCljBYTxM6HRqX92
	b31/YFbJ2EGeiCjsi4mOQ==
X-ME-Sender: <xms:lQYQZzKp_IJOdGFoM-IhqH-28UuuQimulDAq-WmMbpkLMSAWCyn68w>
    <xme:lQYQZ3ISpWMOtoaYn1ErUIwiOSs8B4ESqcpGq2iDQdVbljLnKpFLkXYj0Zc382AsP
    DA-7q5IRwoCgStVO5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslh
    gvrdgvuhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehnuggvsh
    gruhhlnhhivghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepvhhvvhhvvhhvsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgrthgthhgvsh
    eslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:lQYQZ7ueU5DPlczQvLMOSZ402Fns57FWEvtlvrTxC2QKh_gAXiFeLg>
    <xmx:lQYQZ8YDflcpQC-rxh-OvuLs3aMyx7VQBf0XgCh1D2L39i5h8NADFg>
    <xmx:lQYQZ6ZD1-JfOc0fkTAD_FQxFFwtLUBOOgVQSHkVe5mVcdg6NCAZ1Q>
    <xmx:lQYQZwCOXc4t7puz8fgvDcgZ8xZp5ME-AkhR23BLQJ2xOQe-UoWLVg>
    <xmx:lgYQZ8Agc7dtrBbXc3v3q1z6VfnjQ_xbmHEnvoqXXnBlHlZNLXbBE0Us>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5DD572220071; Wed, 16 Oct 2024 14:31:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 16 Oct 2024 18:31:27 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Nicolas Schier" <nicolas@fjasle.eu>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Aleksei Vetrov" <vvvvvv@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 stable@vger.kernel.org
Message-Id: <a22ab6cb-6eb6-44df-9e82-b6e95b9ae08e@app.fastmail.com>
In-Reply-To: 
 <20241016-disable-two-clang-enum-warnings-v1-1-ae886d7a0269@kernel.org>
References: 
 <20241016-disable-two-clang-enum-warnings-v1-1-ae886d7a0269@kernel.org>
Subject: Re: [PATCH] kbuild: Fully disable -Wenum-{compare-conditional,enum-conversion}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 16, 2024, at 18:01, Nathan Chancellor wrote:
> -Wenum-enum-conversion and -Wenum-compare-conditional were strengthened
> in clang-19 to warn in C mode, which caused the kernel to move them to
> W=1 in commit 75b5ab134bb5 ("kbuild: Move
> -Wenum-{compare-conditional,enum-conversion} into W=1") because there
> were numerous instances of each that would break builds with -Werror.
> Unfortunately, this is not a full solution, as more and more developers,
> subsystems, and distributors are building with W=1 as well, so they
> continue to see the numerous instances of these warnings.
>
> Since the move to W=1, there have not been many new instances that have
> appeared through various build reports and the ones that have appeared
> seem to be following similar existing patterns, suggesting that most
> instances of these warnings will not be real issues. The only
> alternatives for silencing these warnings are adding casts (which is
> generally seen as an ugly practice) or refactoring the enums to macro
> defines or a unified enum (which may be undesirable because of type
> safety in other parts of the code).
>
> Disable the warnings altogether so that W=1 users do not see them.

I don't think we have to go all the way of completely disabling
the warnings here, they are still potentially useful. I can see
three ways of being less aggressive with them:

- keep -Wno-enum-compare-conditional in W=1 and fix up the
  remaining warnings for that, iirc the Wno-enum-enum-conversion
  is the one that causes the problems.

- Move them to W=2 instead of always disabled

- Leave the warnings enabled for clang-18 and older.

     Arnd

