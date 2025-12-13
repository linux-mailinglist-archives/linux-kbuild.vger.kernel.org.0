Return-Path: <linux-kbuild+bounces-10093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562CCBB102
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 16:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B78D8301B5B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 15:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB952D6630;
	Sat, 13 Dec 2025 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="G078ZJCT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCBE2D63F8;
	Sat, 13 Dec 2025 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765641441; cv=none; b=VdKWxAVggIsWzV+qyer6CmFTUwEwo91Rr7fIePV19B9VWO4v/NwNxZXd8LUzPcqCQw6F2mvIewg0GWiqKRzKJTir6bgn8ExwDFoadrAXtNxuxY99fU32jjsh5zs9iNDiSafhzTjTrQ6Na29MfDL2U+FCXMV+zdY+2xO1x/2HG6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765641441; c=relaxed/simple;
	bh=beItitjX9g62dtNCQNrmeuH1IQRm8RLLxfGpegHrzg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNnu1rykv1HtLzNOAkUK4xSGVD/CYrhXsZgj3/L9+m3REw1L7+2JmSdINzY3Gft4eqVAdBsfqtPkFE8VS8PoptQRzTKfL3RjyPcMIGxe5PFajvujTgfWp5MsYvHtYoMH+jkmJZdzExd/2lLApxDe9MDDAswKq1FkusvXL/cBdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=G078ZJCT; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 4E65A58031E;
	Sat, 13 Dec 2025 04:16:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21FB51F68F;
	Sat, 13 Dec 2025 04:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1765599383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIqdS8u8Zgyt0ZzuuPPbcBwmYBvu0KqK59FdenEwKSk=;
	b=G078ZJCTPooC9/mSXIJI9PeuT4h2ukEFgcD93TorotB/dcWuqEFGCUjORkm+jF4yvUXKNb
	TnNFiSULNcfxwshtmjM0tjkdKWeHaDyh8TLoGsEOM8rlhjYpyIFV3OtD+mENAgJO8twnNC
	zrs+60gZE2bFmJaDhL5dw3gU+LsDpp/LCvRWWSXbBf7F8wGzzaNtH9/xGcRXkSvIXahIiV
	BRXtu2GS+35cQbMLhzH+YMV4iIROrz5Ggjc5j5VXNkVf4mMt/QBgcRNfzO7CHLnJ7CmT6w
	MfaN4kAtMMqy/DGAXe0SJp1gSP2Xo0Ny6gcqrKZCkdQO50CpgCIuTA7xfsgLQQ==
Message-ID: <b476af54-59dd-4b33-aa5c-4aded5d88e19@gtucker.io>
Date: Sat, 13 Dec 2025 05:16:21 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnheptdejheejheffvedvhffftdefuddvkedvveevleeuieegkeeukedvueefvdejteefnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemvddtfeelmeeiudehheemvgeitgemgeehuggtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmedvtdefleemieduheehmegviegtmeeghegutgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgegrgedtmeekiedvtdemvddtfeelmeeiudehheemvgeitgemgeehuggtngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepvdduhfeuheduhfeikefhpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegruhhtohhmrghtvgguqdhtvghsthhinhhgsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh

[+Onur - sorry I didn't Cc you when sending this series]

On 10/12/2025 2:58 pm, Guillaume Tucker wrote:
> +def run_docker(args):
> +    """Run a command in a Docker container"""
> +    uid = args.uid or os.getuid()
> +    gid = args.gid or args.uid or os.getgid()
> +    cmd = [
> +        'docker', 'run',
> +        '--interactive',
> +        '--volume', f'{os.getcwd()}:/src',
> +        '--workdir', '/src',
> +        '--user', f'{uid}:{gid}'
> +    ]
> +    if args.env_file:
> +        cmd += ['--env-file', args.env_file]
> +    cmd.append(args.image)
> +    cmd += args.cmd
> +    return subprocess.call(cmd)

Just realised that it also needs a TTY to handle Ctrl-C signals
correctly, otherwise the Python process would stop but the container
would keep running in a detached process (same for podman):


diff --git a/scripts/container b/scripts/container
index 74644ac33685..e05425c06d28 100755
--- a/scripts/container
+++ b/scripts/container
@@ -30,6 +30,7 @@ def run_docker(args):
      cmd = [
          'docker', 'run',
          '--interactive',
+        '--tty',
          '--volume', f'{os.getcwd()}:/src',
          '--workdir', '/src',
          '--user', f'{uid}:{gid}'


I'll send a v2 next week, but I'll wait a bit for any feedback first.

Thanks,
Guillaume




