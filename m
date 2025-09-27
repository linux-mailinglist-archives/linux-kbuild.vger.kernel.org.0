Return-Path: <linux-kbuild+bounces-8964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E38BA6286
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Sep 2025 20:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B69417E6C4
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Sep 2025 18:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0F922E3F0;
	Sat, 27 Sep 2025 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CafC/Zj1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A73224AED
	for <linux-kbuild@vger.kernel.org>; Sat, 27 Sep 2025 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758997424; cv=none; b=ncQN5zZRj/GFvCANoy+3M9zvIWi/cIT75XargMz7dsMc3qPOBfqdJWpTZhw+MrXqOBsWITrlMfYPqpz6SQpdar9aXlo4iOSZOickNUMDEe/gQnanZ+Jqod8JK0m4V4Ny4CqrRiuJjZL5+o+BL8izw7uaN4f4O878wiAhva6nRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758997424; c=relaxed/simple;
	bh=a32sQJVfPZXqmEzs8zv4pkQ+9dUbnvyic13n8J/n5Rk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=otw9G7J72SCYKtsxYRRBdKipYJeWzMiTl6ZDmyhj76UT2tjsq6pb81372u/A/k7wWAmH4JZ5OXX4Rtuj5CkIbGdsUKM01FdLLjQUMx1xuOi5YZAFPumY+R5GBbSSpZ5LHRPW0CkYRp6siI4UI2W1vjaEk7JSKTn+o2Rss5ZZPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CafC/Zj1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2b4096539fso571094766b.1
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Sep 2025 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758997420; x=1759602220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K0e0fOwUe69F30vUK1tqSUGtJFIwsjPuEn1/9ZYJ/eM=;
        b=CafC/Zj1cn2YE8fWvhjslUxDJEKJTjdPcJvyOSkVCwFPNDQ5dPPEbJwKfMDEAEotsM
         zOlY1O/vMIrxex2227cxujuJ996Eb0aXZ3/7s5ZbwFU4mpkGMKRLYTXqCkgXutwCInj5
         PFYUSEzJQfjHBYOFOpQQXpesc1ZyrjvB2MT70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758997420; x=1759602220;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0e0fOwUe69F30vUK1tqSUGtJFIwsjPuEn1/9ZYJ/eM=;
        b=WHv4/Zb05fRc4jSRFMF0FHgyuxfIWxLlsM4cOeMI6p6bM+rvJnI30e8ymL5eJdeXwj
         uwpjVYToHqHqEj/YRrGO3iSFaBPYv0Ci9JYrElmWAGaoYyYBrjjS1ZAwDGKJ3aQ772y4
         6phgkEPgp2LIQha8VkCclI8QmXHyLnec7Otjqz8bIMkj8WmzIt70wfd0POleDD3U4A2V
         RQiWPkBQ6ZivsUJwBYVbBnTn83Trj/HRUVjR3ffUCZO524fbSWJf662iVTAuWPsfgW7h
         2zdOfhNO/fQ7iE7/QqxjqBdlYOYkqplG14VAWNslZZ6Zcxku9FsDUwKkPpZGbOZglzJ9
         vlgQ==
X-Gm-Message-State: AOJu0YwCyiRDSr1OnPb1dCcc7FUzwuOi0mb8G+ujobsPcKsA+qmolNng
	AdlAk6AZ1K1qY1eLL0TqHZawatcLLoovSflfRJOnZMF4mEXQkFi/9F7X9p1G2U8wULsdwPYIGW1
	iZr0iYhA=
X-Gm-Gg: ASbGnctjY3S+RDW1rTdw4eTOL2kBgH65NPeZRhomPRnRO1L+uYYYoqadxIoimaMg/d8
	34TgSzkOQTzlaW3IE6B6kGTKH38ed6LdM8WY6zFHQHIOfpbXFp/42le6dngSaVpveXsCzB6tRWV
	aZaXKsCK8fi1ean5Ta3h+J9RW6sAkE5ObwzbzBrm7uMfH7nzpkFqr32oV1FOmWpXzhq39bE6XLg
	YPwvf4AFO6/HJOtZEXqRLsnokaMXTRnMzbhO+dXu6thyAvpsmRnk0+NC6H6DwGcBQASqOKmM/KA
	kxMN7AAQHx5PwD35XEp3dzMleWPc9eBAs1tKWLEF1WDYYtSooBvdmY+AKDi/5us8InV/thr/vyM
	BLDMM9y0SJrlviKmhxxZAiU3ZmEAekkBHMXNcJQGBCGS/5fffZ8wO75ovmiVKcQVA8/z18ubRv4
	4FmuhN9e0=
X-Google-Smtp-Source: AGHT+IFtGyNeYCipVnTKGInldiK8ZnF8C5aWH/lhAgTmQVhXLzk5nppXnGOGtZibNdL/gi4SepXfUQ==
X-Received: by 2002:a17:907:7f9f:b0:b2f:65e5:a5dc with SMTP id a640c23a62f3a-b3a0da338edmr386121466b.6.1758997420168;
        Sat, 27 Sep 2025 11:23:40 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629878sm4851452a12.5.2025.09.27.11.23.38
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 11:23:38 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63486ff378cso6426306a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Sep 2025 11:23:38 -0700 (PDT)
X-Received: by 2002:a17:907:1c16:b0:b35:3073:28ac with SMTP id
 a640c23a62f3a-b3544101c80mr1362489566b.0.1758997418530; Sat, 27 Sep 2025
 11:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 27 Sep 2025 11:23:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>
X-Gm-Features: AS18NWCBIyVn3FMlYgKPyW7puGkHBHBOJdbS27ePUJAAXwcYirKONFW-7Pwc8Bg
Message-ID: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>
Subject: Tool directory build problem..
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

This isn't new, but I hit the problem once again because I decided
that I should make sure to build-test the tools before the 6.17
release since I got another tool pull fairly late in the game..

And it fails annoyingly and immediately, with

    make tools/all

failing quickly for the ACPI pfrut tool with

    undefined reference to `uuid_unparse'

errors.

Those errors do *not* happen if you build it inside the tools/
directory itself. So doing

    make -C tools all

works just fine, but we literally have a "tools/%" target that is
designed for this, and it doesn't work.

It doesn't work for that pfrut tool because the top-level Makefile
rule does this:

    $(Q)$(MAKE) LDFLAGS= O=$(abspath $(objtree)) subdir=tools -C
$(srctree)/tools/ $*

and that "LDFLAGS=" is an overriding variable assignment, so the use of

    LDFLAGS += -luuid

in tools/power/acpi/tools/pfrut/Makefile end sup not working.

But it works in all other situations, just not when build this way
from the top. Annoying.

I'm not sure *why* the top-level Makefile does that "LDFLAGS="
override thing. It doesn't do it for anything else. Just that LDFLAGS
variable.

Yes, yes, the ACPI tool makefile could then use

    override LDFLAGS += -luuid

but why would it do something as crazy as that?

That "LDFLAGS=" override goes back many many years,  In fact, it goes
back to the very initial addition of those rules in commit
ea01fa9f63ae ("tools: Connect to the kernel build system").

So I have no idea why it exists. Just removing the "LDFLAGS=" override
seems to fix everything for me, but I must be missing something.

And when I say "fix everything", I lie. It fixes this issue, and most
things build find, but it eventually ends up hitting a few build
errors in the tests and then fatally for virtio_test.

That seems to be entirely unrelated, and an actual real build problem
(possibly me not having some library or other, my motivation to look
into it ran out).

Comments?

              Linus

