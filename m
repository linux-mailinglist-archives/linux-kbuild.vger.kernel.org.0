Return-Path: <linux-kbuild+bounces-7467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F04CAD69D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 10:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B837B7A6852
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 08:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD316221DA8;
	Thu, 12 Jun 2025 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Djdn65SD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q1Hun9oF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401920F069;
	Thu, 12 Jun 2025 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715285; cv=none; b=WMNCF6xA1qq/LtIFwLiKPn4oouUnmDbOtx5/kpjqZ7p2OSieDwsjdgc9T8Nf+hHt0cRdqWcxF+ERg2xAj6qsi9d0/LW/HVO/ddYhy7+D7CqL/njvZtugAtTqBVO1olcYi88ddl1BIaOtVcdhAh29CEZb9KgWF4yZxrFtgxe7mq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715285; c=relaxed/simple;
	bh=m2zs+8VpRJtc+aR6SbZTkUZULAfTzFK7CScj34oxfVE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HxU7Z+pkZONC6t+Y+dy2oIljdi4SPPXYGl47dc67g9jSbwlbDSYAY8y9lYQPwrDwHV5es5mrTzjhkwhTI4CH7S6pfj7BgdBVnS+qfn/opE1ghp34zHI59je92xCmtqadGFDaVxv3jzjss3NBcdem39dmCM7EEnnB+vap5fhIAGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Djdn65SD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q1Hun9oF; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E2DC911401DC;
	Thu, 12 Jun 2025 04:01:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 04:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749715281;
	 x=1749801681; bh=ESXbHeJFagXQn1CJAp2zXfESHZ5BTFgFyg2i6iJTqKY=; b=
	Djdn65SDtIlM/HGxUXWA4JU/IBnKZKcpgxCoTJfE6OKBEcC/IctIF/W0MFCe9G2l
	8TOIaHxzFiddQA32Q1UMmccrF1bhYgd1Big/emUnHWzQd5z9NPcdel4cfIbodiZ/
	E489BJK0VmL1FiHg9AKMYXKtSxXzaza0iNPbS6mRSgHHwPXwqj+nN3d88/ShvBl6
	Umzx5ZcZv7eSS+QVynNxhFzitXlC+PlCqQvdnG71ssxgOln8CD9NpY4TfpzlpkpA
	hNMW9GG+kif+ThMzMq+cVtooc3w1+8x6Nws45+L5gOUSwBHB+4tvqMlCobKGT/eA
	mGVRiAPKy2VRenL3rOgHZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749715281; x=
	1749801681; bh=ESXbHeJFagXQn1CJAp2zXfESHZ5BTFgFyg2i6iJTqKY=; b=Q
	1Hun9oF/DwhBK8vo6mO3j5lQ1qT1G+QGPE5s23kLkDPW5fclhpox2bt4PkRl5Mij
	hrFsotl3nCxWANsF8tlFF3bYA2I39LoD80Ux6RLkOeO9ruWLuIgUbJyEqbsjKtbT
	CAeAdvmalAWLWOqSKZbu02O98m1mNYw4yachgdCs4M32Pz3rCet1oXOXUoZrsu+9
	RSDNdaPmSny44x3TjwcE05F5EC/0TJ94a93JPWPvsqm1RLQ82FUbqhYNzMQ6u4UD
	jNxvwhjdIlckCy5iCUAsz7+fxho/hOsBr2WDSjlkUF9dbDz+qjW+cb8FX5vtH/a0
	xLgAy28jO8LDBEmz+y37A==
X-ME-Sender: <xms:UYlKaEjLfviqKKR4d3KgfhQErMHW_tIsvJ_tGYO5cQwzuwdB7IyXLw>
    <xme:UYlKaNBZ9dbNtqp7OZhgCIvjQn2pQn6O-SsmIfN6NA6Apr8onfr-zmN7r8WY1vEy5
    FqQcux8XLUCsdECFN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtohephhgtrgeslhhinhhugidrihgsmhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UYlKaMF1SBiKQcf9DMKPWwawPbd4wPAUybvkuxRiBZr_jkifx-y-XA>
    <xmx:UYlKaFT1dKGkTp8qcj3PdHS2Na0Cg5QDrLPws6pe4GQ3bnEsFfDSBA>
    <xmx:UYlKaByx6RB9tjJ5nLqo9YHNUy3J9A-EFXq7EyrL9ArYHgY8bI69ng>
    <xmx:UYlKaD4tVjeXCPmm8M9GGeQrC-GgOmSqYWTUi-eufeuKFq2uUfA8Bw>
    <xmx:UYlKaCrVdbYyeJd28tAqFoK72V3iqSer_DTZiUk60LYiwDdG4on562_A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8A636700063; Thu, 12 Jun 2025 04:01:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T11a455a1e4054318
Date: Thu, 12 Jun 2025 10:01:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Heiko Carstens" <hca@linux.ibm.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Message-Id: <38a08452-4db2-43e0-afdc-b7d696da5454@app.fastmail.com>
In-Reply-To: 
 <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
References: 
 <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com>
 <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
 <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com>
 <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025, at 03:42, Masahiro Yamada wrote:
> On Wed, Jun 11, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> On Wed, Jun 11, 2025, at 15:32, Masahiro Yamada wrote:
>> > On Wed, Jun 11, 2025 at 4:55=E2=80=AFPM Heiko Carstens <hca@linux.i=
bm.com> wrote:
>> I think this makes sense in general, but the output here is
>> excessive if it leads to users no longer wanting to enable W=3D1.
>>
>> There are other warnings that I think should be enabled at the
>> W=3D1 level (e.g. -Wformat-security) and eventually by default,
>> but that are still too noisy at that level.
>>
>> My own cutoff would be at a few hundred warnings in allmodconfig
>> builds if there is an effort to reduce it further, but it seems
>> that this one is still at a few thousand, which does not seem ok.
>
> Then, what to do?  Downgrade to W=3D2?
>
> I think nobody cares about W=3D2 builds,

I think the first step would be mass-cleanup patches to get
the initial numbers down. A lot of this can be scripted.

> and the problem of all C files including <linux/export.h>
> would remain forever.

I'm missing a bit of background here, and I don't see this
explained in the 5b20755b7780 ("init: move THIS_MODULE
from <linux/export.h> to <linux/init.h>") changelog text
either

What is the purpose of cleaning the linux/export.h inclusions,
and what makes this one more important than others?
I obviously understand that indirect header inclusions are
a giant mess and that any such cleanup helps, but linux/export.h
seems particularly small compared to many others. It was
originally introduced so a lot of files would no longer have
to pull in linux/module.h if they only care about using
EXPORT_SYMBOL() and THIS_MODULE, so linux/module.h could
eventually become private to kernel/module/*.c.

Is this something you are trying to continue, or are you
doing something else here?

FWIW, I compared the preprocessed sizes of linux/export.h
(~2000) and linux/module.h (~120,000), and it seems that almost
none of those are needed by most of the files including
linux/module.h. The one part that is commonly required is
MODULE_{INFO,AUTHOR,LICENSE,DESCRIPTION}, so maybe there would
be a chance to clean this up at the same time if you are
planning some large-scale reshuffling of #include statements
around export.h.

     Arnd

