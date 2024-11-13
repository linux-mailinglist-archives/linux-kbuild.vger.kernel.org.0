Return-Path: <linux-kbuild+bounces-4668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ECC9C7CF6
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 21:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78617B226E8
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 20:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A522E20401E;
	Wed, 13 Nov 2024 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeLbu6Uu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42318A6C5;
	Wed, 13 Nov 2024 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731530004; cv=none; b=jpiELOBJKH6o4oIUYigdOzcvJZ7MJLeEzrpsTQCBYeHDHUN2xd59DoUg6JKGMLT57g/Xdwf7XqQy29CAbsli5GB0R2lZ99BmYqKsn1DkImhKacjQ75cniJ3Mds7uqkq2FO4Z8KUkohCODqrjfeJNrHFKidyWapEzKHdcCYYUV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731530004; c=relaxed/simple;
	bh=1qkybLLJBacioaCp847jzAEZavaYdaBya2lzXuTEQ5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cC/Ey7vaSZRyGbOUaNs0X8tM9cPlqQKQCbtfPRT4iY6hR+mX4ldkSj9MN+hEwK+nTFQc/1ORa39CGeIwqCOIjLAIt/Gs48sX5V2DRDiedMegmagKfpKEJugGL1ZwKSOkFUZ+UJHXrPLTAU/um47ERVQ+IS7Z0QvEOl4sS1MuaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeLbu6Uu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F8FC4CED2;
	Wed, 13 Nov 2024 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731530004;
	bh=1qkybLLJBacioaCp847jzAEZavaYdaBya2lzXuTEQ5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jeLbu6UuqKt4Et49AKZYE2XlcvOh7sZZ77E5BIZAhe0+bKIwWpWcopmS37ZFvV47J
	 Xn36XkqV32F8l0N7sm1iB3H7dcrq62+cG8pHz6WBjBhHPVNDY+r0c9jvQF1lPnr4pf
	 lK7M8FrbIt/FZD/jwgujeBv1dLT06uVTQfb0xcEtkDeq8BpGUmWzwVVBl2PwoKcfz/
	 5HcH75y/VG424c9pqtlh7YdbVyDrH1xHgK9ENLbmg4ZJM9kVJkwZPanm7FhEiWwLvb
	 CMLi1NEyjUt0rlL2E/TYbh51B2oAyyhLUk0lcYr2Q1sM65XVP44oK6yLlIiddVYeL7
	 VfKjErO2dXhRg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e8607c2aso8081931e87.3;
        Wed, 13 Nov 2024 12:33:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUO8KEBM6KE2jAgD7kv7FDpYTRAVAN07PXUsH8mGg3dxdhT+Ob3YHTmlaqHbLue5X543/YPWzNU@vger.kernel.org, AJvYcCV8lGrRuzf5dQxkzV3xKpTshQwFam1yx/BXlToK5vUlsn9dX2QbSjc571EZ0LrrTldeGFN6bUX/5YUjPEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YznH2lhZ9JrA+ZeavG7OQyjWoupHoQjwEtXdRaBXYmkL0VigXq5
	Em9UiZOwaH/u+J3FV5tM7lAyG8dMzVydHKArWtdOAMfKHCBzPXobtkxHERK1DTA0BQ9eFyT+cfD
	GkBKwqhGjj4QqunFp0TKo13EO1Xs=
X-Google-Smtp-Source: AGHT+IHn9oRm8ELrPUSJsk7WRdtvxyVbfPTpgRXaJzicZWCwkgORHUqXJ7+Io6pdVeIlKbzDNaDWddiN68gLbLOXOE0=
X-Received: by 2002:ac2:4e13:0:b0:53b:1fc4:46c8 with SMTP id
 2adb3069b0e04-53d862c58d4mr10744151e87.27.1731530003051; Wed, 13 Nov 2024
 12:33:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
 <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
In-Reply-To: <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 14 Nov 2024 05:32:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAsyOparQ1YxgPh9S4A-uzF04k+91t7Xy1jdTy6uT+Vg@mail.gmail.com>
Message-ID: <CAK7LNARAsyOparQ1YxgPh9S4A-uzF04k+91t7Xy1jdTy6uT+Vg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and unpack_fields()
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	netdev <netdev@vger.kernel.org>, linux-kbuild@vger.kernel.org, 
	Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 5:08=E2=80=AFPM Jacob Keller <jacob.e.keller@intel.=
com> wrote:
>
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> This is new API which caters to the following requirements:
>
> - Pack or unpack a large number of fields to/from a buffer with a small
>   code footprint. The current alternative is to open-code a large number
>   of calls to pack() and unpack(), or to use packing() to reduce that
>   number to half. But packing() is not const-correct.
>
> - Use unpacked numbers stored in variables smaller than u64. This
>   reduces the rodata footprint of the stored field arrays.
>
> - Perform error checking at compile time, rather than runtime, and return
>   void from the API functions. Because the C preprocessor can't generat
>   variable length code (loops), we can't easily use macros to implement t=
he
>   overlap checks at compile time.
>
>   Instead, check for field ordering and overlap in modpost.

This is over-engineering.

modpost should not be bothered just for a small library like this.

Please do sanity checks within lib/packing.c



--=20
Best Regards
Masahiro Yamada

