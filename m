Return-Path: <linux-kbuild+bounces-9135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C811BDA219
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 16:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77613582259
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 14:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2D02FB62A;
	Tue, 14 Oct 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="FBgizFy2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891C52F7AB0;
	Tue, 14 Oct 2025 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452978; cv=none; b=NiJHh7m1beEi121mVZ5rMXcmRZdQxQbJD2/c7dSqgQrpWBshMoXu14mzE66wYugozzL5JpNb55OJlzUnPyAnQUxa5SNm8qXwG6xSxSqXWopSeEa5avDDOtFj988BYL7d/quIuQWpgQNd/+MLXQW72RZCNZZ+1m3oj+0btv/Iu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452978; c=relaxed/simple;
	bh=N13x1nvnuSJuCyjLOXkobgpSeb/7E32zTOMfW1aipCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkqCF2wlPD+ad53nSOBfwiPEUBCOYDiZW3bQYEdseTErfrkSWF6F2xyF+bRtxzergsSJs/sujPkn48Pahtv1XcsLo/VT8+3AJEtigkui1UXAZ9rUnwQHNZnTPSKiAwIl586CLXz106yOyWA+i9WGY7b10mhLstL12SZgTop3ra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=FBgizFy2; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBFC543EB3;
	Tue, 14 Oct 2025 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1760452968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwEtsBEHQHNjKmiVlv9ptHV7LTbzYaxJdAEv4ya/P3Y=;
	b=FBgizFy2hVc3HStDI/6HKg/pS1UHJF+HzARUS37epj+Qzl0yhf/clJdPfMUV3HNwrNFrXU
	DAjp/oTgccSTrfhhqFyWSjwyoXDuJ+549whSSci89Ax6ofg6OuDLpqWGaEFnKC/0Vc+KcO
	RbCtyYVa4NunSQtbpAhVllxWgp+L9FkmReVwo1Nip7UlBj7mpRzMThFrNgvz4JZYHtJG87
	HDOhgtglsi6xbAWuWucIfn8zLdng9z+rZHA7zU011RBhnrdQnvWRBd6tibY9VFv6yKTMLi
	saSILGzz+eVUD0nKXQp+qzUH4yzgblS1KMsAZMFpbd+37s9yhhpvZk6096pZtw==
Message-ID: <29c33635-cd83-4a47-aea0-460f196f1e3a@gtucker.io>
Date: Tue, 14 Oct 2025 16:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER
 option
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 Arnd Bergmann <arnd@arndb.de>, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <20251014094511.627258-1-gtucker@gtucker.io>
 <20251014094511.627258-2-gtucker@gtucker.io>
 <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
 <20251014170842.2fc00c88@nimda.home>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20251014170842.2fc00c88@nimda.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

Hi Onur,

On 14/10/2025 4:08 pm, Onur Özkan wrote:
> On Tue, 14 Oct 2025 13:58:10 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> 
>> On Tue, Oct 14, 2025 at 11:45 AM Guillaume Tucker
>> <gtucker@gtucker.io> wrote:
>>>
>>> Add scripts/Makefile.container to wrap the make command in a
>>> container using the CONTAINER= variable to specify the image name.
>>> For example:
>>>
>>>      make -f scripts/Makefile.container CONTAINER=korg-gcc defconfig
>>>
>>> The container image name is entirely arbitrary and the container
>>> tool may be Docker, Podman or any other compatible alternative
>>> specified by the CONTAINER_COMMAND variable.  The default is set to
>>> docker for now.
>>
>> IIUC, this wraps reruns `make` inside the container, but it means
>> hardcoding a particular tool and path, right? (unless one sets even
>> more variables)
>>
>> The cover letter says one can create an alias for this, but one could
>> also do that for the underlying call anyway, unless I am missing
>> something. And if we do this, then I would prefer one doesn't need to
>> type `-f ...`.
>>
>> Put another way, for a user, what is the benefit of having this extra
>> way of running in a container? For instance, I could see the benefit
>> if different tools had different flags or it was a complicated
>> procedure, but I think at least `podman` shares the flags used here.
>>
>> Should this instead be a document inside `Documentation/` somewhere
>> that explains how to do this, pitfalls, advanced options, etc. and
>> give example command lines for different tools?
>>
>> If we do end up with `CONTAINER=`, then I think it should make it work
>> without having to pass `-f ...`, to make it easier. Or, even better,
>> like the KUnit script, we could have a script that does the right
>> thing and reads a config from the user, so that one can just type
>> something like, picking whatever tooling the user configured (e.g.
>> Docker vs. Podman, default image, etc.):
>>
>>      scripts/container.py defconfig
>>
> 
> I think this functionality would be better implemented as a script
> (like you mentioned) rather than a Makefile. The current approach is
> likely to run into several practical issues (e.g. file permission
> mismatches between host and container, the need to manually remove
> containers with `docker rm`, etc.) and addressing all of these
> reliably in Makefile can become quite messy. Writing a python (or even
> perl) script would make it much easier to maintain. Also, it can be
> self-documented quite nicely with `scripts/container.py --help` command.

Our emails have crossed - OK I'll take a look into this.  I fear a
script is actually going to be more difficult to maintain and will
require additional dependencies on the host i.e. Python.  But like I
wrote in my previous email, I'm happy to consider some alternatives
and see if we can find a consensus.

The issue with file ownership can be addressed with user id mapping
in principle.  Garbage collecting containers is not something I've
looked into as it's not a new problem compared to starting containers
explicitly.  I'll keep these things in mind too when comparing
solutions.

Thanks,
Guillaume

