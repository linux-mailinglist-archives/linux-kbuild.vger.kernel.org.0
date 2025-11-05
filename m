Return-Path: <linux-kbuild+bounces-9426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90031C381BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 22:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289BC18C7A0B
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 21:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30722DF14D;
	Wed,  5 Nov 2025 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="WYkRQoHm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C912DC341
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Nov 2025 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379597; cv=none; b=IjWwlrO3snHl6zbXA1uAgN7rhXPFyLi6O1RN+/43zUVYJeOWOcRX+QoTbx2FFSkBdpfSMkJmi8TSZz9SHvHT2ya3hFgA6CX/ttV35RuNuA0mV3pu+c4+YQgSeARmkIBJMhGQOO4F41TpJsxnlSKpqECrVMqfTCP5/GYFAoZXD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379597; c=relaxed/simple;
	bh=roR+iHl5+yKbGXMgn+r+Uy/w3fFO0IOAH40xnQ+p/4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jb7pPPSaW4Xcz4cJDYEvEe1fXho6LdX/jrKlxzRlboG3Ni7H9nOT+xIK9gqP8Smvcbk1e1IYeAFiryZ93d5+owKOn2VejWB9xhpwBh8NdAELvk3SNIxe5AFAUyVkP0BlMJMXxVyJ6olcjTd0ufNJHA4C+aGpBql8T8LPxXoPcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=WYkRQoHm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33bba55200bso44046a91.1
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Nov 2025 13:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1762379595; x=1762984395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXYPCL23ES9Iyb1NQ2+5KG+FblnpsKPGwtWMhH2bakQ=;
        b=WYkRQoHmw3VBywzUB+zNfAcc9p+MOWN27p9a0PCgMY7RnvfSuiX+fYrUSVMPvaGZ2P
         25pCinmce4kL4B5fFSs+8e9GLJd0BvRhAhg/my/UnkDxCeJwl0LHgg7W+L9L4iiN7jXv
         sh2sVKm/e5fkfUXXs24zjyfaRLmePqeoehCmhVrRI1qw7Mf/bKOaREPW3smOm+KDJzbD
         +Hf1TpEmOiO3cF7z/paR5SM5xPhB4HbxB2XN+XA3QCJHcSXq1WK3pk+2sL34Kldpw+Of
         TTgvGbvY9F+zWW4Y9dZSiQJk5LRwCwGVQcC17igMhu30jYUyyfPmWsdrZB4lzdCTALYG
         wWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379595; x=1762984395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXYPCL23ES9Iyb1NQ2+5KG+FblnpsKPGwtWMhH2bakQ=;
        b=Vujv3xwOpBhB2gKb+W9cBjHJcJ4VKIyka8Muw9d4YHFdj63a4AMkzb8JjtvR5vTH4S
         yCXHk28bkgkQQnhZgoxHNXkBpdc6jKZQLiq1mdRqDl7MSVCnA5LYOGV7gLYRu9NdOcEs
         Ie1spY/5IwLNevSu5DAKZXEkj7T0FpHio129j1LMQi9/7P0SYPhdnK6pmzWQSX2Fp0BD
         hMrURnIlXQF667bmltP4Z1LTTAR8KiblpDfZL5X6saFxkzzOE1KV3G046soAvcE4JLJ/
         3+oIAdECXH+LWtkUsGtpSEIsJZ4GspjaUCyj0mhNL7GYGcijegeK80x1bHGEtsB6Fl50
         AlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkUX1VFLBOqYQ5swOff9tdmnFaEDos2yCcA7hyGL28sM53h9t1YclJa7rDknVq+awdsQYVPccDYMDjcFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvE2Nt4mC1McfgxtaQW3xx1iIDMZMZr35msOAPnSy6YQCbW2b
	BkthS+jhDNY0kx9KNqgPHimfwVngpsbRp0UqG80Harbp87PqsMObqNxfIuZh5CRrIYo=
X-Gm-Gg: ASbGncuYhizUdWNDl6/zcwfY/L4K9x+7rPD6koBUaynb9Cf6cmirZmEEIisglTGeaRB
	mtPfjdAaq8EJc5NRlL8ZGEwvVtPz1jaBT48el2KGghPKwEm6roshiLQz7Wg9j0bhkc3C22FcRTO
	YW/1sbixTWvFJsJz0uvvQCAEv5hWFHeo+PkyK3R6jNwW/C+GQZGpidPkRIKDhdb8BfLZ1dENZz1
	rbWa3d/PyFl8VoDbzFw+mvVPoUKcWuKYjoaK5dmF3ivggrZgq8aOF5xWpbg3QrihPnOcnCACBTx
	rFn8p+CMBXN69JHWxpvVqAJ7EicO67khlgRrWFTwwoyAKqgV40EsWWS9aHnUp8c4zsjpnWwvv6+
	aPav+7ygPGkiSrF54O5QbFmyKV4l/14ZrIvnoIpZIz3FrrzlAUxTiDh931C2gMFennT3+ow==
X-Google-Smtp-Source: AGHT+IGY0r/CwQ4uYP5m9fphBTj5UtPwNG1Wco2SGrHkrgNEwj6b42fgxZjgQDbYi9yCWcOKFr/ugw==
X-Received: by 2002:a17:90b:1811:b0:340:b501:3ae2 with SMTP id 98e67ed59e1d1-341a6b0d5a4mr3477066a91.0.1762379595410;
        Wed, 05 Nov 2025 13:53:15 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::7:5bbb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d048e1d9sm221963a91.6.2025.11.05.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:53:14 -0800 (PST)
Date: Wed, 5 Nov 2025 13:53:13 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	linux-kbuild@vger.kernel.org, Samir M <samir@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQvHSVXbOdiN_J5D@telecaster>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
 <20251105011548.GB769905@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105011548.GB769905@ax162>

On Tue, Nov 04, 2025 at 06:15:48PM -0700, Nathan Chancellor wrote:
> On Tue, Nov 04, 2025 at 08:35:57PM +0000, Dimitri John Ledkov wrote:
> > On Tue, 4 Nov 2025 at 18:12, Omar Sandoval <osandov@osandov.com> wrote:
> > > drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
> > > commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > > vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
> > > for some configurations, which confused drgn until I added a workaround
> > > (https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
> > > So there's some funkiness in this area.
> 
> Omar, could you provide me with a configuration file that reproduces
> this for you? Is there an easy way to check for this situation on the
> command line?

Here's a script that reproduces it:

```
#!/bin/sh

set -e

host_arch=x86_64
compiler_version="12.4.0"

compiler_dir="/tmp/arm64-gcc-$compiler_version"
if [ ! -e "$compiler_dir" ]; then
	rm -rf "$compiler_dir.tmp"
	mkdir "$compiler_dir.tmp"
	curl -L "https://mirrors.kernel.org/pub/tools/crosstool/files/bin/$host_arch/$compiler_version/$host_arch-gcc-$compiler_version-nolibc-aarch64-linux.tar.xz" | tar -C "$compiler_dir.tmp" -Jx
	mv "$compiler_dir.tmp" "$compiler_dir"
fi

export PATH="$compiler_dir/gcc-$compiler_version-nolibc/aarch64-linux/bin:$PATH"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux- tinyconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux- -j$(nproc) vmlinux
readelf -W -l vmlinux | awk '$1 == "LOAD" && $6 ~ /0x0+\>/'
```

It prints something like:

  LOAD           0x1ef008 0x0000000000000000 0xffff800080220000 0x000000 0x000000 R   0x10000

I.e., a segment with FileSiz and MemSiz 0.

Using a newer crosstool version fixes it, so maybe this was a GCC or
binutils bug.

Thanks,
Omar

