Return-Path: <linux-kbuild+bounces-3395-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34796D28E
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 10:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110C11F22F28
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 08:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32217194C78;
	Thu,  5 Sep 2024 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N7HAjZ51"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651119306B;
	Thu,  5 Sep 2024 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526601; cv=none; b=nLB5slr/V7E54Us744ZRyJtn+Zk1z2YA5/KPteL+5ZxoF/k2fZU+CGmMFLuri6OHpoWDuLtq/x2XgHFigoPLd3RFN7EKLA0gF48GcXF83WLULAPesCr5/T9/B4woKNbL0+zcYW9Iqn3P+0CuVJXUr7aFkOCdRJSbKYVGhbo0gFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526601; c=relaxed/simple;
	bh=lR3f9z5+bJOCN16mknr8cSYjqxmDWDdmVojFejJwrK8=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=IP7BQxwDp5PJrPogjzoZZsU9BUddiB2wwYGV8mh9dpXfZKx3qkfrI4l7GGFKBedxOxLxliRvqi0SNcI+EeWRN7T0q1SH4RAv7FvJH75MkFYWWGah+b3o5GAgQ3zg1zsS4mrTtm2FO6iaxUR5NxslNq3jpMUoNCZRI7xDo1ra3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N7HAjZ51; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240905085629euoutp026d23b874dc2b4c65d9a6a01407115ac4~yTUpf2Xb21854518545euoutp02F;
	Thu,  5 Sep 2024 08:56:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240905085629euoutp026d23b874dc2b4c65d9a6a01407115ac4~yTUpf2Xb21854518545euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1725526589;
	bh=9a8tFXSZRMxLBmYQzS/kxbNtP1L0MZWsD4TqGlp7igU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=N7HAjZ51jmxy9BBeyooMEtGJD2xagVExFDlCmdrqM2MzvMQqhnnRdKOvvZk8v66//
	 VGI8nL3IDBhzn4wA/swMSvnSsTrNPI+i3NhlLHwm4R5sHWyAmGFbbylMFut6lJF9ce
	 ZqAIqd6NJMp7KvICb3452HHarib2yVtW2tlDZang=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240905085628eucas1p1ed6920b6eae12d07ae7c9af3cf92d67b~yTUpJA8CL3245732457eucas1p10;
	Thu,  5 Sep 2024 08:56:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id A6.A9.09875.C3279D66; Thu,  5
	Sep 2024 09:56:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240905085628eucas1p22cae5811f1069426701b93fdc830d15a~yTUojeqiQ2167621676eucas1p28;
	Thu,  5 Sep 2024 08:56:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240905085628eusmtrp1efe21bd6c68924032fa05fae82051942~yTUoh9Mth2800128001eusmtrp1t;
	Thu,  5 Sep 2024 08:56:28 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-f0-66d9723c9f03
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.1D.14621.B3279D66; Thu,  5
	Sep 2024 09:56:27 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240905085627eusmtip11ddc5ce1558090a422182326f3629f59~yTUoPhjM90089500895eusmtip1f;
	Thu,  5 Sep 2024 08:56:27 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 5 Sep 2024 09:56:26 +0100
Date: Thu, 5 Sep 2024 10:56:26 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
	<thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, William Hubbs
	<w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser
	<kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul
	Moore <paul@paul-moore.com>, Stephen Smalley
	<stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James
	Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, Nick
	Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "speakup@linux-speakup.org"
	<speakup@linux-speakup.org>, "selinux@vger.kernel.org"
	<selinux@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
 (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com"
	<gost.dev@samsung.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
Message-ID: <20240905085626.ehhc5p7qwi57dagm@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0yTVxjGc75bS5fKRyHhTAlMptkgEdyFeKLMTOb0i2ZGR4iZm9EOPqoZ
	t7TCwExFYNwGDYiKVG2AAtXCuJSLlVsXcIVOGZPKTTDAKHew3CQQHB3lw+h/v/c5z/vkff44
	fFy0Sm3lnw+7wErDxCHulICoMaz8vctX2hu826xyQ63d+RiyFKUBZNCM46jO+gJH1ppMHD17
	ZaFQvKqMQsuV4xgaaFRj6OVdF3SzWEUh5VMjgSarmgmkHe4i0etaHYZMtXco9ESVzkPm63oK
	jQwXUShvrppAQ4M9JHp4x0iihjIThbSmBRIlphSRKOn+CIVmM6wYGm1oJdGNlWkKzWT8yUN9
	17IJpFd08dC95WyA2lsMPFSjawNorD0LoJy+PoCmdOuhVdOZJMpP3IMS+n1Qb2E570tPpkRZ
	Aph6QxvFNCzlEkxtUyXFPFS84DG52kgm4dEMyajqJzBGq0mhGGWKEmOs6YMk88iaz2PyYm/g
	jNJ4gtHfLeExA7+1YMfhKYFvEBtyPoqVeu8/KzjXf3WViChyi5bP1xOxYB6mAjs+pD+HXfJB
	KhUI+CL6HoC6dgXGDYsAlk0nYzaXiF4AMLbj5JsNg7yT5ExqADVLRsAN66a+2bHNQQug9qae
	tK0Q9A6o/v3BRhRFe8BGo5ZnYyfaE/YXJm94cFpjD+VJ3jZ2pH3ghGIRTwV8vpA+ClV1HjZZ
	SDtAY46ZsMn4ekxZrTeH26B6jc+FuMH46tu4je3oE/C5ZYbkbt4Ob2XeJzi+BP+qer5REtKV
	78FmUwXOPRyEOROdm+wIJ1uqeBy7wMdZaZvLElhQqtjkCFjfpyBtN0B6H5Q/CeHkA7Arrw7n
	5C2wZ8aBO20LvFaTvSkLYXKiKAPsULxTS/G2luJtLcU7tXIBoQHObKQsVMLKPg1jf/aSiUNl
	kWESr8DwUC1Y/x+P11oWdUA9OefVBDA+aAKQj7s7CaeceoJFwiBxzEVWGn5GGhnCyprANj7h
	7izcGeTGimiJ+AL7E8tGsNI3rxjfbmsshieuxk8VLFc/ePWvz+WegNCdK8d8/D/+FRY1r0WO
	/8f0h+cfIT2C7SVDcd+eLoiKGTgUuFcbZyn2Fcd8JD3wMv3r+mM/fhENBsUyRV5defroyRW/
	NbNf5txu5qj8SEdAeeVXcxFhs7wrUaXHaZmg82rWM+kfZtXC3v3KS8IC+8A049OSDo9Jk/OE
	wz/uh5Pc9C3Xl3Sdmu+Ffk0NmKMhhjnk76yvCo8b07sU89kjrt2NrsXffCjx7y4dPay78oHK
	4mmKen3KMTd2jyAg/IfezLGKyu0Cvwq7NvOuqYWy1l/mb58+M3RZPTJsabRKo/d1XRyt/y7P
	9f2og76FCYLOzxbPLrkTsnPiTzxxqUz8P7SJ/reOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHc+69vb2YIHelhhMwcyvLJsS1FCgeRMz+MHodms3NLZmTaEcv
	j0gpa+kytjBYYCi4Gsp4SIcNj1BGh0PKY1BBDGBLtzFY2HgjKlIFeQpsEixdC1v0v8/v/L7n
	k5Pz+1E4z0D6UglJKawySZooIHcQv25aJ96MUI7EBt1ySFDPUAWGFg3fAmQxPsLRDecEjpzN
	Whz9ubZIoszKOhI9bXiEocmb1RhauLobFf1YSSL9HzYCzTZ2Ecg0NchBz8wtGBowl5Lot0oN
	Fz0o6CDR9JSBROXLTQS6d3eYg1pLbRzUXjdAItPACgdl5xg46ELNNImW8pwYsrf3cFDh+hyJ
	5vNuc9FYfjGBOnSDXPTD02KA+qwWLmpu6QXoYd93AJWMjQH0uMUlbZzTclBF9n6UNS5BI1XX
	uW8FMrX6WsC0WXpJpv3vMoIxdzaQTKtugsuUmdRMVvc8h6lsm8EYkzGHZPQ5eoxxau5ymG5n
	BZcpzyjEGb3tJNNxtZbLTF6yYu/C08KDSoU6hX0lXqFKiRR8LEbBQnE4EgaHhgvFIfujDwRL
	BKJDB2VsYsJnrFJ06JwwfvzrDSLZsOfzy0/aiAzwBOYCDwrSodBy+S9OLthB8egqAJeK57jb
	jd2wftXdcLM3fDaYS26HlgFcrC4A24UJQMfYylaKoF+D1dd+xtxM0gHwps20ZeLTgXC86uJW
	BqeNXnB6Kd3N3rQEzuhW8VxAUZ50FKy8EeA+5tG/EzBj2dfNnvRL0FbygHBHcJeyzizaRj9Y
	vUltC/fAzKbvcTd70Cfh6OL8f09+FV7R1hDbnAZXHHaQB/i6F6S651Ldc6nuBWkZIIyAz6pV
	8ji5SixUSeUqdVKcMEYhNwHXwjZb1htagH52WdgJMAp0AkjhAr7nY/5wLM9TJk39glUqzirV
	iayqE0hc36PFfXfFKFwbn5RyVhwWJBGHhoUHScLDQgQ+nkcG+mJ5dJw0hT3Pssms8v97GOXh
	m+Ea9wfjd9YH/WY31amvC06E9ucqCyaPeY1Eau9lh7HrXaJ3FAp58FHJwjHZeF1N777pj+pF
	kWux9V2neH4bw9nJ4vO9iRpW6O/9so9PxD9qMzVvDRnql13JiPA/7VhQTrXY+SWrZzi/eFes
	fNnvNXrq7ayFzA3x+/auCINYNBTVLRM49mYmhPtcr94pbf8kL/2njcKLqTPpH5asfnXpvoPn
	b6lPyz6wElxUZGeirffLi8226PxvThxP2KnRrF2j7hy2fKqN0qCmxn3WmPYjoVZnR+nQaKsY
	67w9d0trHJCVU2/Unzu8OuItNObX7BoqjV64cLRHfmbvUul7aQ8DMlm7gFDFS8WBuFIl/Red
	liuoOQQAAA==
X-CMS-MailID: 20240905085628eucas1p22cae5811f1069426701b93fdc830d15a
X-Msg-Generator: CA
X-RootMTR: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
	<20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
	<CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
	<2024080717-cross-retiree-862e@gregkh>
	<dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
	<2024080720-skyline-recapture-d80d@gregkh>
	<20240807-mottled-stoic-degu-d1e4cb@lindesnes>
	<20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
	<ZtIjNBhqdxmMBxfM@fjasle.eu>
	<CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>

On Mon, Sep 02, 2024 at 01:15:01AM +0900, Masahiro Yamada wrote:
> On Sat, Aug 31, 2024 at 4:54 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> > > On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > > > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> > > > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > > > Also, as this is not internal for the kernel, but rather for userspace
> > > > > > > builds, shouldn't the include/ path be different?
> > > > > >
> > > > > > Can you suggest an alternative path or provide documentation that could help
> > > > > > identify the correct location? Perhaps usr/include?
> > > > >
> > > > > That is better than the generic include path as you are attempting to
> > > > > mix userspace and kernel headers in the same directory :(
> > > >
> > > > Please keep in mind, that usr/include/ currently does not hold a single
> > > > header file but is used for dynamically composing the UAPI header tree.
> > > >
> > > > In general, I do not like the idea of keeping a elf.h file here that
> > > > possibly is out-of-sync with the actual system's version (even though
> > > > elf.h should not see that much changes).  Might it be more helpful to
> > > > provide a "development kit" for Linux devs that need to build on MacOS
> > > > that provides necessary missing system header files, instead of merging
> > > > those into upstream?
> > >
> > > I took this suggestion and tried pushing a Homebrew formula/package here [1].
> > > I think I chose a wrong name and maybe something like "development kit" would
> > > have been better. However, would it be possible instead to include the *.rb file
> > > in the scripts/ directory? So users of this can generate the development kit in
> > > their environments. I would maintain the script to keep it in sync with the
> > > required glibc version for the latest kernel version.
> > >
> > > [1] https://protect2.fireeye.com/v1/url?k=96027706-f7896236-9603fc49-000babffaa23-452f645d7a72e234&q=1&e=343dd31c-5e5b-4b09-8ee5-6c59a1ff826e&u=https%3A%2F%2Fgithub.com%2FHomebrew%2Fhomebrew-core%2Fpull%2F181885
> >
> > I think it sounds sensible to hold that formula file in the upstream tree.  But
> > I am not sure if scripts/ is the best location.
> >
> > Masahiro, what do you think?
> 
> 
> I do not know much about the homebrew, but why does the upstream
> kernel need to merge such masOS stuff?

The missing headers (in macOS) need to be provided somehow. One way can be
having the formula (*.rb file) in-tree, so users of this can install them in
their systems. This would also require to have a tarball with the missing
headers either in-tree or somewhere accessible so it can be fetched.

To avoid having the formula and a tarball in-tree, I've created a Homebrew Tap
(3rd-Party Repository) called 'Bee Headers Project' [1][2][3] that can provision
the missing headers. The project provides a bee-headers package and formula
that will install byteswap.h, elf.h and endian.h in the user's system Hombrew
directory. It also provides a *.pc file so pkg-config can be used to find the
location of these headers. I have a v2 with this solution ready, perhaps is
easier to discuss this with the code.

I think we can extend the same package and include extra headers if we need
more in the future. I see for x86_64 asm/types.h and others might be required.
The bee-headers package can then be the repository to place and distribute them.

Please, let me know if you think of an alternative solution, I can give a try
and explore.

[1] Project:
https://github.com/bee-headers
[2] Headers repository:
https://github.com/bee-headers/headers.git
[3] Homebrew Tap formula:
https://github.com/bee-headers/homebrew-bee-headers.git


> 
> 
> 
> >
> > Kind regards,
> > Nicolas
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

