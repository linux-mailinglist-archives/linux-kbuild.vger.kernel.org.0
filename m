Return-Path: <linux-kbuild+bounces-4831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB79D6BB9
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 23:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDFDDB21398
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 22:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D93419DF53;
	Sat, 23 Nov 2024 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="N1CLjlot"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEC2905
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732399955; cv=none; b=rlssKhT9gYOtVSjSHvu/iFa0JUOsCW+00BOUAPmt3I8K8KqmnysEK4x7AVaPMYjKW0kzQzclbRSKeU4dExZoI1UF77Borj7RuC6K197CErYG1J10I3uc0HJxc7UY/WOQ1aRj13mBnypp6IVJBNOT66hrFL1oyzA3HjqaVJzqgqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732399955; c=relaxed/simple;
	bh=cnT8cxB4f5vl4i47fA3TpvN9eokvJjXCcRbdJWJ/p8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iwyK3n0+7tev49rqs19z5UAjLvXFZoh+VpcMsejNQGsheeVn6nq1rDaDhsXE2+ejXN0701MXt6ZIxo4kAi62Ky/u13kCaT2XNJPPHwMhpVmF/wAxDDAoUc2tB7B9qvJ2LRnrgqtjSni8uNUlzGsGtN3CNqcod9i+REHhF2HV32U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=N1CLjlot; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso40070725e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 14:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1732399952; x=1733004752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hJMk1Q9thPNNORDbV2y9r+sPvljGjGuxKg/TqvIb0s=;
        b=N1CLjlot5/Hf+oN7kS2Pw3JtiBmYdhn5SIpHmpJjXRTMNN7d9Iq7WaFVybsEwJUF9T
         ERsTe6Cu3iCeXJ3sa8f8j6rAZMk5uDg0dO6gwZigndfW7B23ptxe8wQfCsqD7NY4PTNb
         ckSzMcTix4EBrUlfvJmYxNWcpkOZELTeRVZPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732399952; x=1733004752;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hJMk1Q9thPNNORDbV2y9r+sPvljGjGuxKg/TqvIb0s=;
        b=O27azQiFlpZ6M8ym6q4hRV62NPu/KADhZrYKRowDCSoQTm1qX3lmcGhGJPNp0YyRXA
         tanTgHmkwRVS6ipUdxXVxDMs64iGbMCJJVmc2Xivc5/jbfQqIc/X00zg9J4uTH912HSG
         fl3knOaV2xoKvNRwrfmxvsLwvSZbizJvikqhVP4xR00SFb/srdNo6UteEBdmzMXtnHTX
         QSSxZNGs61JVlHzphxnTJUyW12YUhOxrfigtxRVQTFTg8hInrsIwj9r95AQ+fuu8X0a3
         f7s8TCEEqbm2QL3MG8RfHRY7rsdea/klwKEtbYuKLtBVr5hs9bQkZP9C+pjHX3AxezPJ
         Z6ZA==
X-Gm-Message-State: AOJu0Yw0jhlzMNPj3EpNq5xOr2IyywUgaqIVJimR8rHXuqiJYOwDZBKD
	WEbf2szDdDurIIRZs2NhiWE1+aZZ8niTRgfT32uVIkdj90A0rbfvUQpZ0C44DZEk+mZFue2ha6J
	k
X-Gm-Gg: ASbGncsg5ucL2WSoX1tp5B6CA1ST52HEJWqj5PlsJCvstcs8aqvSm0vg+DuvKlW+PNh
	tgduARF3rBwkdEtFgKj/Kg8jmmoziOndmyeh1+6IuyUVIEGChCH+Z9CzO6hE5fyUUNjhReRah+y
	dCx25R0QmEZ04CMERrpFWgIDhlVsJGN45eF1n5Sd8CPhECIG/mqdZ93NLgIuxCzs+egbgdZcHly
	YRIzfpc/0U0f0G4aGS4z3MSJKnO/t7X+tuhcuBcIh5U9YRXnxQTXk5m8mzE0MlgwD+b+FZScF06
	HBqG1fvM
X-Google-Smtp-Source: AGHT+IH0FJ1dScWxXh3gke0ac3724CE5YTFEz4/6/BNARCRAO2i7EPuxXcsfzjRgGjmKk6XA9cy/hA==
X-Received: by 2002:a05:6000:154c:b0:382:440e:4e88 with SMTP id ffacd0b85a97d-38260b52679mr8610591f8f.16.1732399951587;
        Sat, 23 Nov 2024 14:12:31 -0800 (PST)
Received: from localhost (77.33.185.121.dhcp.fibianet.dk. [77.33.185.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b58ae64sm270623566b.169.2024.11.23.14.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 14:12:31 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,  Jeff King
 <peff@peff.net>,  Sean Christopherson <seanjc@google.com>,  Josh Poimboeuf
 <jpoimboe@kernel.org>
Subject: Re: [PATCH v4] setlocalversion: work around "git describe" performance
In-Reply-To: <CAK7LNAS6aU4L+4JyDXzncMVsY+6XRYTD=RkhcXSUXTRh_WxWWw@mail.gmail.com>
	(Masahiro Yamada's message of "Sat, 23 Nov 2024 17:06:50 +0900")
References: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>
	<CAK7LNAS6aU4L+4JyDXzncMVsY+6XRYTD=RkhcXSUXTRh_WxWWw@mail.gmail.com>
Date: Sat, 23 Nov 2024 23:12:39 +0100
Message-ID: <87iksdk3ag.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:

> On Sat, Nov 23, 2024 at 12:01=E2=80=AFAM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:

>> v4:
>>
>> - Switch the logic to make use of the return values from try_tag,
>>   instead of asking whether $count has been set.
>
>
> No, please do not do this.
>
> As I replied in v3, my plan is to set -e, because otherwise
> the shell script is fragile.
>
> With this version, -e will not work in try_tag()
> because it is used in the if condition.

I'm confused. Previously you said that "either style is fine with
me". Now you've invented some necessity to add "set -e", which of course
yes, is then suppressed inside try_tag. But there is not a single
statement within that that would cause "set -e" to exit anyway: The only
one that is not a simple assignment or is itself a test is the "set --
$()", and git rev-list failing there does not cause set -e to trigger.

Aside from that, I'm skeptical to introducing set -e anyway, it's simply
too hard to reason about what it will actually
do. http://mywiki.wooledge.org/BashFAQ/105 . But you're the maintainer.

>> +try_tag() {
>> +       tag=3D"$1"
>> +
>> +       # Is $tag an annotated tag?
>> +       [ "$(git cat-file -t "$tag" 2> /dev/null)" =3D tag ] || return 1
>> +
>> +       # Is it an ancestor of HEAD, and if so, how many commits are in =
$tag..HEAD?
>> +       # shellcheck disable=3DSC2046 # word splitting is the point here
>> +       set -- $(git rev-list --count --left-right "$tag"...HEAD 2> /dev=
/null)
>> +
>> +       # $1 is 0 if and only if $tag is an ancestor of HEAD. Use
>> +       # string comparison, because $1 is empty if the 'git rev-list'
>> +       # command somehow failed.
>> +       [ "$1" =3D 0 ] || return 1
>> +
>> +       # $2 is the number of commits in the range $tag..HEAD, possibly =
0.
>> +       count=3D"$2"
>
> Redundant double-quotes.

Perhaps, but sorry, I'm not code-golfing, and trying to remember when
quotes can be elided when variables are referenced is simply not
something I spend my very limited brain capacity on.

Feel free to make any adjustments you want and commit that, or drop
this, I'm not sending a v5 as that seems to be a waste of everybody's
time.

Rasmus

