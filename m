Return-Path: <linux-kbuild+bounces-10312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCACD454B
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Dec 2025 21:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D47753004B80
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Dec 2025 20:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D0A319850;
	Sun, 21 Dec 2025 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="I+tqQM+O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59966318138;
	Sun, 21 Dec 2025 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766347591; cv=none; b=ufKzUjgJRrKoizE/t4A5KWpeQbL3XtaJ9vun7t8xvtKKwh/oZ1ojuGee6hwrF8DmtccrlTAtoD2pZWvDlLurfj9ZgaezefvApp+/4nll5tzsxnY3LHKFJbbJMNCoR9l+jZA02bJJnL+eNJPlO3YTdqn8lrzZzjM2jLSfwLyYtPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766347591; c=relaxed/simple;
	bh=zNnqaKZBSekNsX/KcgxQrrHlzmMi6CcT6Wz6BnoiwCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNq+quchhaVZOkqUWN7vHs4xz1bzDlCsJ9RxoSpfyDarpJ4Fr+6tOYefJFxrYnQI+bnTFFmjKlvM4CPBhwsQ0TFwaPt7rgrVJ6K3xlD8eEKgglW6QOgX2kvRXJFVHZfej56k15VEjyh+8RBbWmsMNcfBtzm/bA4Bsf1AUfhstyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=I+tqQM+O; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id DA06D5807B0;
	Sun, 21 Dec 2025 20:04:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76D5B41CFA;
	Sun, 21 Dec 2025 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766347452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qa1iIFKuk8NI0XERRHjPLRaCElYBzFa0XDvEQaphdyQ=;
	b=I+tqQM+O3I8UFm++5QWWB4AaoHp/PMD3r69Tg25rHIq2SbL7nEDPZ1TauGGXhFyI/KiQ/t
	1j0x+WoU/P7Unvk+V7SPjhz1CAv/t2b6pUl524Wdj/De9fVgIFBCIlRlK0n0p/rbTMpVeU
	UaGR5tQ8UtIXNdrAuyiyki8fEMmvyyG1m2EMKNmD76eYbJ93MXHjqydq7glHZeuASuNT2n
	mA/uEHSrzO/HEXdG7ZjgATjfrWBu7cENRacyYRSokM3mu8roeoIbrQVU8vEeISaafikItW
	jGUm2pq3U7LLOJvB5bAMMxj+v5utApgZofWhANRXlas9fXPv1E4c0/5cn/E+Xg==
Message-ID: <4a0f381d-94e8-4e05-838a-5e90c6627fbc@gtucker.io>
Date: Sun, 21 Dec 2025 21:04:09 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
 <20251219194748.GA1404325@ax162> <20251219211518.GB1407372@ax162>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20251219211518.GB1407372@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehgeeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepjeefkeevheekhfefleeuiefffedvgfdtkeejgeelgeelgeekuedtgfetkedugeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudejiedrudeghedrkedurddvuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudeghedrkedurddvuddupdhhvghloheplgduledvrdduieekrdduleekrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeejieffheeugeduvefhtedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhug
 iesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegruhhtohhmrghtvgguqdhtvghsthhinhhgsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh

Hi Nathan,

On 19/12/2025 10:15 pm, Nathan Chancellor wrote:
> On Fri, Dec 19, 2025 at 12:47:48PM -0700, Nathan Chancellor wrote:
>> Most of these two functions are the same. Maybe they could be abstracted
>> into a simple class so that most of the logic could be shared between
>> the two implementations? That also might simplify main() a bit and make
>> fulfilling David's request a little simpler as well.
> 
> Sigh, this is what I get for working through my inbox bottom up since I
> see that you did this in v2 :) looks good, I will give a couple more
> comments there.

Thank you twice for the reviews then :)  Yes I'm glad the v2
pre-addressed some of the things you mentioned.  I'll reply there too
regarding user id management etc.

In the meantime I also started this thread about container images:

  
https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/

I believe this will go hand-in-hand with the scripts/container tool,
not with hard dependencies but they will enhance each other.

Cheers,
Guillaume


