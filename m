Return-Path: <linux-kbuild+bounces-3354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E21A96AD2F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 02:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B4D1F25517
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 00:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDFF65C;
	Wed,  4 Sep 2024 00:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUCx098X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624AA391;
	Wed,  4 Sep 2024 00:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725408952; cv=none; b=iDRu2+VxRV0bcUgDbXGxgAT/V7gxprvOrA25UdyP1xOOPoaHOU+t0dqRPlb/B7bT6KZzKGxH6EIRC/HZwGtAZIfd8cxxN5/Wp0sg19lnfkmwjzNFC1oLnG2Y/hI+oT+MQG+Usf3pD+gOphSk8otonQIVsLUvBPkuGsFxE6PVWTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725408952; c=relaxed/simple;
	bh=d4HzHlcyWhxhYwrf+ZdncBLTDdqhz1jAA19ceRLiAdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUu+ZMunhGAgbqp4AeARkXEqSBeOzod6JpNsAlnuUtHXgoJlmy6XzU0L3Az2IUCM4K4ZE+QLcRTviHQRUYMFnBFuTYLDZIPLAyWJqVtofGbFMc9s7mTMAKzDTo6ozAxScJoGotUpgX+VCSX7pp4oii+9aZmRXrlxGofuIALuv18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUCx098X; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7c3d415f85eso760220a12.0;
        Tue, 03 Sep 2024 17:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725408951; x=1726013751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvNhaHXkaFL0Epr1sED0M5HwOXo21A0WSrifM/juZnE=;
        b=HUCx098X+L16bfSw69VhAZhNlMe81rGnFV7aJkuOnOm394z6yAzZ1vjHSj8OvVJVke
         waiZnZBlAh7hrUW1D5617FQMsSkvpZc1a/DeiaHgZvNr4Cu7KzQ9YX2ZQTTXeH6aIhZr
         TVlI7JgO0mXtMlvduaJeLIbtB2fx89fQVE7pz59ZozsYn1JMjG7XGzk7Sbi0GWbmMprn
         q0MabhW/Zo8oKtxTFY5EM+aarrYmo/Iiilwk4/HvEwzpqD7yft69Mk6gB/CkMBcXUAYW
         wLOuM69lSNgxpouezxoEu81NtYwGc3eXh5wxvVWUHWHMm0Yz0mStaSeGX2+fmoWFB+7h
         xkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725408951; x=1726013751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvNhaHXkaFL0Epr1sED0M5HwOXo21A0WSrifM/juZnE=;
        b=bdno1jVFDRJ0/54Wb6d82FlmVbnROON1tQovTyHdWMB7NJX52ppNZfr5rqSHxBnrKp
         ggZ9grYseWw5DOqJlWaFuICROmbTdNmq3s8LuA8myu/z/IZaw3eTkTAU5mgRuTZ4oelD
         fYynmgQsfpS9LNB2bSHPUezYBj9oGizPrBLB2hJI6C7k784OSlh0hLiSv5MbdfmKh4MX
         I9CbeQ1pEoIeSZ3C5VKu436OrA7s/bF+7i2WKiSnRYCki4AkyMf3FDRYEHY4gvW/8hcJ
         SrNy5YO3LYJKpegS+P2Pk553zshTy5Fo3HCJimqft7cQvhSb1FbfZJqVtojDCrt2SOtS
         aPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQgK7xEoREh/teLS937GDeGck75n/yJ31H8O44ZxBdf0ozjZLag+f/sEXEcJ9kNr+nCNmfV0egmJacRrc=@vger.kernel.org, AJvYcCW0Bymg2Cd8o1m2Pzhg/Mhve6uPeT01bnwrbbyyZYRz/VdwZhGSRnh0E8fHZACeczeyroHpD8NEh4dNeeQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz+d+NUIt4hJBTSb5uaP/4os7iKUTMcv37PXykjqJoi5HOKXwt
	QJoljXR/rChj/jDfmT1t+O0k6fKIu5tI3urq/Sr7PrCyELgaa7uf6O4N+n0QALQfbk/PT/NU7IH
	AHY8EAid1yKl4ZRJKE1Rw/HWeH+0=
X-Google-Smtp-Source: AGHT+IErZy5Q2Ts0A0vkjKg869s0jLwCVRYZCjG3no5WSj++BQIHoeXoTs1Dabp+pzStx5LKZYTJqtuSltaEX5UC6Bk=
X-Received: by 2002:a17:90a:157:b0:2da:71f8:7ff with SMTP id
 98e67ed59e1d1-2da71f80949mr1686174a91.5.1725408950587; Tue, 03 Sep 2024
 17:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902160828.1092891-1-ojeda@kernel.org> <20240903-super-elk-of-bliss-eaed2c@lindesnes>
In-Reply-To: <20240903-super-elk-of-bliss-eaed2c@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Sep 2024 02:15:38 +0200
Message-ID: <CANiq72=KrOnx1utXaM17x07B=V-6zmW5nA+zYKS0AU8Rd+2v9A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 9:49=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> thanks, no objections.

Thanks for taking a look!

> I'd rather like to have
>
>     output=3D$(echo "$output" | sed -nE 's/v([0-9]+)\.([0-9][0-9])/\1\2/p=
')
>
> here (thus, explicitly check against a two number subversion), so that
> we can detect also versions like 1.100 or 2.1 and bail out.

So I didn't change that here to avoid more changes in the same commit,
but happy to do that if preferred.

However, do we want to make it too strict? i.e. I don't think it is
very unexpected to get v1.100 or v2.1 -- it may not be what current
`pahole` does or ever do, but I am not sure we gain much by being so
strict.

(Similarly, for the ^..$ suggestion, it could be that `pahole` decides
to to something like `pahole v1.25`, i.e. `name version`, like other
programs).

Either way, I am happy -- I doubt `pahole` changes too much, and if it
does, we can change this too.

Cheers,
Miguel

