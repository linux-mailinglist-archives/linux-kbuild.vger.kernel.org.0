Return-Path: <linux-kbuild+bounces-5339-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B170A0097B
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 13:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5594E1640D8
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 12:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BB41F9EAB;
	Fri,  3 Jan 2025 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ajz7/YUf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB31F9426;
	Fri,  3 Jan 2025 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735908617; cv=none; b=DCF6EHhhJ40o+OYJrNEHGZMxAfQvOZyk/ycdjxiJ2KZwfYs3HDSzCZrhmg/9dxJeBC1Q1KsDogiBaKOilNlO8WPyP9UHqKkzU8kfutHkECLhEJG158/w821uFCq98ncscHxix024GJaS+nXvThBquUw5o30b+7w19CMjyLccdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735908617; c=relaxed/simple;
	bh=eowNIMUi0cIA8eleCKI/b2O4L9eWToEJdB5IFS+WEL8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=eYMw1CjMTrBU8oWQ4xI5AVpbFuijumi3hu92aEKbL5hnNH40JzYT2URm4awfFTY12orIkWTCsqeChX+gkSqhKAGfkyRkzGUtM9vmJ3gV7drXXNaRg3bBHsBHhAh02o5osMGEdS+gtX1OZBc8EBYKDHT6V35ZK8oLXSVi8X6/P9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ajz7/YUf; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735908607; x=1736513407; i=markus.elfring@web.de;
	bh=rC02SXiR9Z4OKjEwkMvmbRsT79Ij977vPD00Sx2tebA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ajz7/YUfjuHJaEnUxk8lZdLpCGyXVq4Qf+tyJ5NPQdr/BBPdWC/u6eLTHwjtWY5P
	 YCwbbSOcYOad/vvNJ7BIF4SS1TnA+/Dd9EoGdx/jSXpnZ5wmyKNHNEK4KxGNYMaQQ
	 aDTBVrquR6Ig/UrbVen//G//6ZnZy9Tj05BPgKUjW7FWEDIZkoTbKTmNTjPoXIaln
	 INL/kheb5JJ2fijQxLkMf/HblZJ/Lt0S2xqfMucjP5eJIydwIZv8TB0FWghTtLb0x
	 3Ltf9HYIVHEa1M1d5kOki5s/R80k5ZSRxQe5MWQGkscso17vUVz9tFqZ9YUneVG1P
	 dskTmbgpNwmXvVhjmg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZSFY-1sxBzl049u-00UDXT; Fri, 03
 Jan 2025 13:50:07 +0100
Message-ID: <a7da70a4-19bf-4d53-a6c8-a5ddc422a199@web.de>
Date: Fri, 3 Jan 2025 13:50:06 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?=
 <agruen@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20250103073046.2609911-2-masahiroy@kernel.org>
Subject: Re: [PATCH 2/6] genksyms: fix memory leak when the same symbol is
 read from *.symref file
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250103073046.2609911-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EIMueVHvHfrkh59CprQVR50tf99FXuDZdf/ejrQOxCjoQfbTsda
 9IfNdJw+yO/fR/0KIomOXzpkvtUKwYm71oZKoxfUJYt+ET4PFdt4mILbzYKk3YfCtBuDBPO
 SJoX14yihnTwkD7SNSerYsD8MpvfJoGO+cYM+ZOuKJ+FjL5Z0HmNRFCFjflGDF7ojwTMI0p
 SVr143X+qAgs5piVIr5ZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cVfjBp/Kis4=;dN8wgCjORDqn2WJqjKRVhLq3vRb
 ItWS7zQ0DNJknrqQouRFZMEh+g2XhqNhKQ8oExFVMQ/bJEPLj/LD13QWhRUnE2ysJkneeHewW
 9rS2md2vDZRSkckPJ5nP/UHSoBk60CVeyjqS+7x72JiGoKCd72tIbWNUy2pmTRrZhIk1ggm7s
 ONiDbIhYPfIydHr3xLEHrR1XhwmaRkJrN1f1VNVkfvjr69CMZ6OIy6z3L6s9kS8pLSviRWxTp
 YR8OBTC1PQ9mv5+i5Bf+s2BlXPiZZdtkzfGLoEsuQbSH0ye9FMQJTE3a+yK8+aUK1LCSLBLKi
 xQD7tVqdo+S/zcTBPMSeiNvbZEqk/3qC/9vKjKj/vbE9XPFTl18wvb+JlwHiILM5eZrJIVytL
 jBU4cwvCKj8IMYbVjwJTDGaY5VeGYyaZ2X6n5NPS81pvQgFbMNQi/L0mXNs8I5HRz1YM4OtYo
 hcl9zQ5iEr9+uJrPlOPlUPC9ZsgRG2G06LohnVMjDeGw0xBhcFGPyvLc888jT+xnpfcVQFstt
 KiSQpckMjj1UttsFsNviWCMu90Wi2NavMZyVj17kdskthKMvRBaq1DJFVR2o0xSGtDLHIR8V7
 5ieEYKRKj5j7DJu3jVM9IN3bvZoDi4cSgSaenLS2p2W0Ou82ul99lHXLkeIwYtFiCKNAawaDL
 kYPr1XHQjYP9z4mDQgnjiy82VrX5D+k1ukJl7wbkSa2AEHo/7GG/Jd9iHSpXhcusN4en2bzaE
 oer8k7Uu7tQXE/Mo+VamaEQr0tLJx/m+fCEjbv9NoLWzbaA2vp2BHifHLrSB6nrhR4BGb3xy7
 jHdy523vRky8Nr+ASCiEfVu3grjZHVlT4OhqARVgj6zAewl8xUoXg9YLfGzBWMqudU14rqWov
 K8TQNNcVspjd4LA/G/Sia7ZdW1+n2b+xfs6JLJ0JbQX6sByImdHwr/CF0A1jmg/ipnZ01qvzS
 AzBuXqTs4IcNZTYBEUdSrocX8PFIXKf/CRJy9s37qEPutuQg0I8LRamrRBcFvt/8gD6GJSFc1
 T5P6mE6fNWtLZF7TOhKkZjKRUhlEOi7GIMxNLvXNyzP8DRors4elZ6Vdw2GEY8lUFNqiiPuLR
 4RNzLSol8=

=E2=80=A6
> +++ b/scripts/genksyms/parse.y
> @@ -482,12 +482,12 @@ enumerator_list:
>  enumerator:
>  	IDENT
>  		{
> -			const char *name =3D strdup((*$1)->string);
> +			const char *name =3D (*$1)->string;
>  			add_symbol(name, SYM_ENUM_CONST, NULL, 0);
>  		}
=E2=80=A6

I would find it safer and cleaner to separate such adjustments into anothe=
r update step.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.13-rc5#n81

Will code transformation concerns be reconsidered any more?

Regards,
Markus

