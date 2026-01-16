Return-Path: <linux-kbuild+bounces-10610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B2AD2F8C5
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 11:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4ED34300FBC0
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 10:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF4035BDDC;
	Fri, 16 Jan 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="pNVv8tH2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377F30AAD4;
	Fri, 16 Jan 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768559316; cv=none; b=Ny36VlKF9qv2QJVOpAW98/CgABqmOUtBUU+pJ05oEuvzZoPOa2Q9VnhIWZFSJndvkDFvZyezu1O3Bbjig71jpztJyXimxBJyJS+Ev6Oxuz0EC+eHddCmS1ibhQQIxH1pAng2JpEnZrIIyQxNTNVDzyiTBp1yGYGjXnAAoo8dXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768559316; c=relaxed/simple;
	bh=NWT4fqaPSR5Wbi/YaVXMhA5Y+CY1AeO2zyoYubCyZE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLYv61YHUBsJu8DTwWW1rYzVVdOphusaLX/muAXiDSYK++UshAWifmNOxdHIEDQECnpFLLI/PJnutJ0rX0IFdPf6JNyW6vFC/Is177DYbQYQf7quQOUMd1L675BMAoZvttCJBYS/lLsf4Rlw5NfdRXJWXjy0gAQ2/MzB0jutYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=pNVv8tH2; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D00D41B45;
	Fri, 16 Jan 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1768559305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnn7+UeGMO3uyCCwAt6CdNrflwgCUAjAPq/d3MXPX6I=;
	b=pNVv8tH2IFjZ+C4gx75aHX7J0nXZ0ewyT/Veh990MkXMykC2GJmVbJJhr/cklEDslBwapx
	AIvo1GtNjAjUIvcgVvPjYPHStrlUMk9ZoefM+88iavOWvD/EdQab/p31EP7+OVhZYHloZY
	msvmdHhTFNbqVNn8exUEiShFI3BPrGwq3DVdKkcNuqK+GNAu16H3dr3RruA9R3UjxmJyc9
	AjHJ7n6v7DsDoZE+BGiIF8HNvOWT/aCmxvcNQPbf8VoCzCnLb67RqOV6cRZcYk/olqeAKt
	6E/K0GbWcuByAa8u368Jaww8Ihwj7vHkiX18C26zwXm5yKqOIL/eP2eq7dSjFw==
Message-ID: <6af4b4cb-cf0a-4647-bdb8-0b2b1cb03b76@gtucker.io>
Date: Fri, 16 Jan 2026 11:28:24 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <cover.1767199119.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdekjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepfeegvdfgveethfffhedvfffgfeefveetkeegudduvdefleejgfdtveeuiedufeeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmegtvggvsgemfhehvdemkegtvgejmegtvgdutgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemtggvvggsmehfhedvmeektggvjeemtggvudgtpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmegtvggvsgemfhehvdemkegtvgejmegtvgdutggnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeegffdttdffgeduueeghedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean

Hello,

On 31/12/2025 17:51, Guillaume Tucker wrote:
> Changes in v3:
> - Refactor common code for Docker and Podman
> - Add docs.kernel.org URL in help message
> - Use pathlib Python package
> - Handle signals in parent process by default
> - Add --shell option to use an interactive shell
> - Tweak debug messages in verbose mode
> - Specify Python 3.10 as minimum version in the docs
> - Provide an example env file in the docs
> - Update docs regarding interactive shell usage

I'm sure you're all busy landing commits ahead of the next merge
window.  Could you please take a look at this v3 when you have a
moment?  I believe I've addressed everything from previous reviews.

Thanks,
Guillaume


