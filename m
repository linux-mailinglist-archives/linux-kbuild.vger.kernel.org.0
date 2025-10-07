Return-Path: <linux-kbuild+bounces-9021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152ABBFD53
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 02:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9CE464E6A49
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 00:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05F3249EB;
	Tue,  7 Oct 2025 00:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="LgljDzTP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4B17BA6
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 00:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795688; cv=none; b=HKxZGBCgPYH4YmgMIudgHe90mzA1pLkL2NBEMS8ZUmopsE3fg/YeRv1Gz73v1mGqIlKgGdHiIMmSUKNdQDwjjUzH5GTQUbQ9SlYNjekm6QgnB1Xzg3utrDQnr2ynusAO7JszLFp9d51cvdAG7mrzxiUKugqD+XSn/8dPVM1cdZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795688; c=relaxed/simple;
	bh=DSUEPvkP2DwWCsLX/9lrVEsFZ7AVqTo0K2qjLowU6Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lb8bzN7Q7uMFhUxYrYagou5YWUQXJyVu7ulhqfc8FbRJb4aDHE12ntqbDqc+nGQjp2I4yKV+FuiVhebLJxQAm3X3UTYZf7DXPRL5bjE/9xzclRTrN5oK3ahVO3QuCgCRU5H39J5hID5Pm3mge/eEWhGPzCxK31C8zkqMbKFnnSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=LgljDzTP; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so1661753a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 17:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1759795686; x=1760400486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq9qIcjsvcUF4yam+tU9a+qMg2zSHLG25BJTSslHp3Q=;
        b=LgljDzTPTetVvFanBzFxi3+B5Os0kK2a2dJCEep19TAOyTb21ZWEZ87Np06Ik/np5s
         Ijl7n6ZB72pUlKvqZkV0i48KjXAGYsRBqR4PlePQYkwhttd7Pck3E7HDNPX6M+K/4xLX
         5Y71UK+ZVGdoFCWQKyOya7JWLneC3fvjxUxNyWbUDfDSPvBzzR+8G0nMXKOrXeKlqZcF
         K7vgysY1C4Ni0VrOerTevIfqaniry/M1/wR4Y8xkIeEARYrKsnVD6u3dylOMGPmCAKdW
         dGtL1tHYjNd95VEHfAXLic5fazSwrDfNYCb2pwQl50dlRUNn7/UNIOxCl3btM3uYEUYN
         AK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795686; x=1760400486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zq9qIcjsvcUF4yam+tU9a+qMg2zSHLG25BJTSslHp3Q=;
        b=lBt/PsOz2dnJt128e378Oquqdi7qbnq1ez153Mn1eej2gX4SrAa0bPi5+OEL86UsVm
         o1NcYKUMz1XIPTAXWQvBK35LmQDKPliiz9+eL2pe6mpkLz1nFuNxGZs+Oec14Yx3RuzW
         94gZGTlCMM+iz7Xg6RPTAhUjb0a3zCiha2Ba+rVkVTDUQPF9pnF6g1ZJn3/w4VeKaRxc
         mYC6bjbtCk/uJDRsubHOpkZOYnSp0+ls0RpaLAejLh6XITlqf1gDhBIaag7Ho3cEuUty
         YnrzArClncwTZw9xf2EfWtI1vLXIW1+QG3pI+jpWGydskO01UN42x0eNhYkBVUzTIYTL
         b4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZIwm49vYKhUsbRAJDOEqBaU8z5Jt0fqd8m/iCD0CcM10DCM46OjNQLhV+wJMeXQB1Sagd/GgQGg8uKMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgN2L1ayMHKq1/ryoEcNj8T6C23zGMTePb3q1qYTBcNb7H2xcp
	qK9rVy/6CLeNHJQ7NMPJsE5t7A6J4HMgCOIVjLSmLKhPQuaQlG6exmdAX7dDg9zob57z3OSPZHB
	xTd26RtvLerThxhFg/5kSEd26RLfsvp6LsY5dcoXG
X-Gm-Gg: ASbGncvveNYp3XXldPOgIeKWZYkVhyL+LMBCafBZ55PmrtwMTGO0Jl5t+V9x9aVQomT
	/qNOO23jAPP5N2ANymMVmofs0cFswGIojjWuRtsv9aC3GN5OZUJ8BWtDq6IgHr8MiQ8ZQRBdwgb
	c8aNdt5iXyknCODJHPgxh+WtjPJ+/j2wnwoXSxIgU1vQnsfQ2lN/gfWJgItB5focgZIBp+eJDmN
	h3emk3yPHvKbASjkp9wCBukdTDPGwX0WsFC5Gd8iFUX7rO933ThASa55c876sJ9xTcNqmfhVfPn
	3cidqVesgx6IBICikcMyg1Rp2SSRgOVaqqEnDdj9CZmOCg==
X-Google-Smtp-Source: AGHT+IHPhlIBiKbk/YdcnVaO7JKqb6dPxyptCcdVhvKYYj4QoSBkfZhcUUjmmKOaDg2NAcrcFXu0g62HYvK4DDW7s2k=
X-Received: by 2002:a17:902:f642:b0:277:9193:f2da with SMTP id
 d9443c01a7336-28e9a51332emr180274165ad.5.1759795686431; Mon, 06 Oct 2025
 17:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
In-Reply-To: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
From: Dmitry Safonov <dima@arista.com>
Date: Tue, 7 Oct 2025 01:07:54 +0100
X-Gm-Features: AS18NWA_rmcs1kDntcbDeUBDvnyJMQFKaIs_dPwivwOgTelEsIMncvtuZPBbsag
Message-ID: <CAGrbwDStsL7=fvm9B3prYh4fQmOb9fTKQ5JQviNa-enjQ3xBcg@mail.gmail.com>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
To: dima@arista.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Disseldorp <ddiss@suse.de>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 12:55=E2=80=AFAM Dmitry Safonov via B4 Relay
<devnull+dima.arista.com@kernel.org> wrote:
>
> From: Dmitry Safonov <dima@arista.com>
>
> Here at Arista gen_init_cpio is used in testing in order to create
> an initramfs for specific tests. Most notably, there is a test that does
> essentially a fork-bomb in kdump/panic kernel, replacing build-time
> generated init script: instead of doing makedumpfile, it does call
> shell tests.
>
> In comparison to usr/Makefile, which creates an intermediate .cpio file,
> the Makefile that generates initrd for tests is a one-liner:
> > file lib/kdump ${src_dir}/oom-crashkernel 0644 0 0 | usr/gen_init_cpio =
/dev/stdin | xz -z -c -e -Ccrc32 > ${target_dir}/oom-crashkernel.initrd
>
> As fsync() on a pipe fd returns -EINVAL, that stopped working.

To clarify: because any sane bash script with pipes should use
set -eo pipefail
which indeed is set in the script that generates initrd.

Thanks,
           Dmitry

