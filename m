Return-Path: <linux-kbuild+bounces-9134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F01ABDA020
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 16:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED39B19A0FB8
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 14:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F1227FD40;
	Tue, 14 Oct 2025 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="LCvnpA9Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5D2C11E8;
	Tue, 14 Oct 2025 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452329; cv=none; b=hEVg5qWtfNQrnMdhnZ1ruBxJ2veGwmT9pGQQaP7Lu+hTZJv/6NxIxrmcnzSKPQgXMLFDxe5ns5WToAA90fNeEzfwLLAv5JtZ+0U3ugryR2iyzfagVmnLO5lSZ+hjjDA01voaFMzyuT1OVh7ixd0h50uJpbIPokX1LkePSNZatfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452329; c=relaxed/simple;
	bh=n4WJpfweZFr1XBq5HOzfqoPfy8WbIU7JboFVT8xctXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLpEymfS9YjjKtRsquM5ir1tDuIKNfYghUCcmpW5rIGszCVo+Ot6Qwnj9heqJ4v3iA8lJPVIgpOwkG21VdOwpXNRq3EsMr9Pl8Nl73Y9i3yCrhyOcVUZSkwG0Y4NvvW4LMStzbnaw5ZaukwzeEJTE4ocApqUKN3o8zp2QlW39bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=LCvnpA9Y; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A58444181;
	Tue, 14 Oct 2025 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1760452319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5huUVJ7kF6GltUc7X1CJvNoxjqy7zqRaKQOUi9Nfsr0=;
	b=LCvnpA9YqMVq7zbIprC8s0J01cLyhiDdfHDVPmpknTQIUJvSnUu/j7Mb+pb5cdEFoskU2T
	6r/bLg7SX5tEBfxRkk8aXY4hlhP6C0vKE2F+y0ceCwFDVPrEd3S2KfyiOnMHt5amk0O+Ka
	t0rKNoC81A5BxWQ2WQMv3q7gNkIRmvMONHZji5CALx022W6x/2cxHprbLfymqNQPNoEntX
	Tex1v5UNXQSZWL4kNTCGEcqNyFAUgmT02u2R+03Bz1WmbtVzgOTw+e1zulxrhAR5NcHvC7
	J4HxjS7iaMYammxuKs8Cbigs9tWjcRf7YhkpEMO6WZq05uCC2Ci5qR0+abwZcA==
Message-ID: <fe53ad80-6eeb-495a-a870-9c42b71f9887@gtucker.io>
Date: Tue, 14 Oct 2025 16:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER
 option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 Arnd Bergmann <arnd@arndb.de>, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <20251014094511.627258-1-gtucker@gtucker.io>
 <20251014094511.627258-2-gtucker@gtucker.io>
 <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

Hi Miguel,

On 14/10/2025 1:58 pm, Miguel Ojeda wrote:
> On Tue, Oct 14, 2025 at 11:45 AM Guillaume Tucker <gtucker@gtucker.io> wrote:
>>
>> Add scripts/Makefile.container to wrap the make command in a container
>> using the CONTAINER= variable to specify the image name.  For example:
>>
>>      make -f scripts/Makefile.container CONTAINER=korg-gcc defconfig
>>
>> The container image name is entirely arbitrary and the container tool
>> may be Docker, Podman or any other compatible alternative specified by
>> the CONTAINER_COMMAND variable.  The default is set to docker for now.
> 
> IIUC, this wraps reruns `make` inside the container, but it means
> hardcoding a particular tool and path, right? (unless one sets even
> more variables)

This is what the CONTAINER_COMMAND variable is for.  You can easily
set it in the environment e.g. `export CONTAINER_COMMAND=podman` or
anything and be done with it.  The default is set to `docker`.  As
far as I know, there's no need for anything else than the container
command and image name.  So it's not more hard-coded than say, the
default $(CC) executable.

> The cover letter says one can create an alias for this, but one could
> also do that for the underlying call anyway, unless I am missing
> something. And if we do this, then I would prefer one doesn't need to
> type `-f ...`.

Yes having to specify the path to the Makefile is an extra hurdle.  As 
the cover letter mentions, the first patch I made was in the top-level 
Makefile[1].

The issue here is that it means that all regular `make` commands
would be going through the `else` branch within a make sub-process
and I wasn't too comfortable with this.  There's every chance that
someone, somewhere is using a particular make version or environment
that will cause subtle differences, or mess things up for someone
keeping an eye on the steps taken by a build.  I couldn't figure out
a way of doing this with zero impact except than having a separate
Makefile and let people decide to opt-in when they want containers.

Then I was only suggesting using a minimalist alias e.g.:

     alias kmake='make -f scripts/Makefile.container'

which would appear to work just like in the original patch.

Defining an alias to run a build inside a container is a lot more
fragile, here it's using standard `make` variables such as $(MAKE),
$(MAKEFLAGS) etc. to keep the commands entirely compatible.

> Put another way, for a user, what is the benefit of having this extra
> way of running in a container? For instance, I could see the benefit
> if different tools had different flags or it was a complicated
> procedure, but I think at least `podman` shares the flags used here.

The advantage here is that it's easier to define your CONTAINER
variable and run make as usual than start an interactive container by
hand with a volume and then run make inside.  It reduces the scope
for differences and makes builds more reproducible, for example you
can just share your command line and others will be using the exact
same toolchain and build environment as you.  This is also to enable
developers to easily reproduce builds from CI bots.  It's been one of
the driving principles behind tuxmake except I'm looking at it from a
neutral point of view here.  In other words, it's a step towards
increasing quality control upstream.

A related topic which was covered at Plumbers is to have first-party
container images, with Containerfiles maintained upstream to
facilitate using the kernel.org toolchains.  It's not a requirement
for this patch but both ideas enhance each other.  An upstream CI bot
using these container images would just have to share i.e. `make
CONTAINER=korg-clang:21`.

> Should this instead be a document inside `Documentation/` somewhere
> that explains how to do this, pitfalls, advanced options, etc. and
> give example command lines for different tools?

Yes, I did think of writing a documentation page alongside this patch
but eventually made the RFC with a cover letter instead to keep it
more as an open discussion.  Any solution to run containerized builds
would need to be documented, even if they're trivial to use.  I think
the Makefile approach is the most elegant one but if others aren't
convinced by it then starting with just some documentation might help
getting to the bottom of this and decide what to do next.

> If we do end up with `CONTAINER=`, then I think it should make it work
> without having to pass `-f ...`, to make it easier. Or, even better,
> like the KUnit script, we could have a script that does the right
> thing and reads a config from the user, so that one can just type
> something like, picking whatever tooling the user configured (e.g.
> Docker vs. Podman, default image, etc.):
> 
>      scripts/container.py defconfig

Right but then I think we would have to deal with the variables
handled by `make` which can be passed either via the environment or
on the command line, so that's similar to the issues with an alias.

We could do something like with Android builds (build/envsetup.sh)
with a file to source:

     . scripts/containerize
     m CONTAINER=korg-clang:21 defconfig

where `m` is just an arbitrary alias name obviously :)

Thank you for your feedback.  I can spend some time investigating
alternative approaches if they seem worthwhile.  I'd be interested to
know what others think of this too.

Thanks,
Guillaume


[1] Initial patch:

diff --git a/Makefile b/Makefile
index c6f549f6a4ae..4cbd8e040db7 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,15 @@
  # SPDX-License-Identifier: GPL-2.0
+ifneq ($(CONTAINER),)
+CONTAINER_COMMAND ?= docker
+PHONY := __all
+__all:
+%:
+       @echo Running in $(CONTAINER_COMMAND) $(CONTAINER)
+       @$(CONTAINER_COMMAND) run -it -v $(PWD):/src -w /src \
+       $(CONTAINER) $(MAKE) \
+       $(subst CONTAINER=$(CONTAINER),,$(MAKEFLAGS)) \
+       $(GNUMAKEFLAGS) $(MAKECMDGOALS)
+else
  VERSION = 6
  PATCHLEVEL = 7
  SUBLEVEL = 0
@@ -2051,3 +2062,4 @@ FORCE:
  # Declare the contents of the PHONY variable as phony.  We keep that
  # information in a variable so we can use it in if_changed and friends.
  .PHONY: $(PHONY)
+endif # CONTAINER

