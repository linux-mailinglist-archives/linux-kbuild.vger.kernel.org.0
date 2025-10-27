Return-Path: <linux-kbuild+bounces-9286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECAC116C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 21:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EEAD84E18C6
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 20:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C414F3164B6;
	Mon, 27 Oct 2025 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adPyGM1X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537F2C11EB
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Oct 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597697; cv=none; b=W8Y3bEBEbueoctAUB0tN7h5PX4Nj4AX6//xBfPm3arKcnGAxVRTGcOYubEqVBxGkeJgGRD/hN/2xFW5O+RW6Xq9wBme40wbOBPZlhfF66xjP+5WuFyPNEPRw2mPUV2oLx2coUCMXHNELxS1uV3Zo6MNql9rUVNt1r8H12WUy3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597697; c=relaxed/simple;
	bh=Bl32hd8+nZYs/Ek7MiWS9IBWG7+TZXS4JVZHy9gRrcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhoJ6UzC4blU1BlAW6ueIueBQsPgPOY4K/wpMsO+FwHy9hs2CJlqiHMA/v+25hR4optG6BfGl53FUp3Fmjn5nX0ZvkOV581F4Ik0z229GbzkHcr27hz6KEwJIynrs9mU3L8/t7laREgr0RuT6JAhixCSrK9JuAOO9SuvtMeEhdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adPyGM1X; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-945a51050b2so81989939f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Oct 2025 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761597695; x=1762202495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V33D0O4zi9GNuJTw8vBA+/b7xPb0jr7CJbcC2/UPqBU=;
        b=adPyGM1Xx0Nj8+txk+x51KcgGxn06jsv3kG++ASxjvenokGtNRroEPOrlMW1jDlMCA
         Nf70uJ8hBCqNnS5GuKeWy5PFp704bF5Rqp9u7e4eI6qK4QP9RrFlFshBp6bR0D8w0jLu
         n+gl012JLgflqqtZ/fWqsxCSSWAmOSlb+u/Ytzu6ptZynBF4TsKCddLNsEcgbGBqGrbu
         9zpmk4BpGBp/vTF7l0QGHXWSiSTRBVouu1l/1vRdQGydr5bQzuDmd+RZHOSxHmBAEQ2N
         8zw8o7vdOZuE5CL+ykSWUXQ+fqZWy2mmWOPweFcJftQI7Ku0QbZXyGSi7JBy00xPnjU8
         thRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761597695; x=1762202495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V33D0O4zi9GNuJTw8vBA+/b7xPb0jr7CJbcC2/UPqBU=;
        b=S5zjM7BgmEBZYXmQc/TgFfTfr2IGt26/0+6QYeK6gBYxhS0nRIoQgLSMmSpE0VD5pq
         ichxpVATCYJwrD88Qg1Cnx2AtObrWeVRnPYoPwBPxiO2nkDIj5cv9H7gJp/HwBGjpGLw
         +7yeFT14fCWD/6t3BjHeJY+ZyfrENXcDHX2b7dDPdVWJuVW/DrZEidndPKh8QIXpZXwL
         yxd3VzNIQfXbCsnC4548Tz/Pce9cBHFs7xuQ5/FMojYmpdwTIgdgg0l0bjHF55Ud73GU
         TNiH3xHw7/x0uOH8Nnef2j+rsl7Kn611MGylKYO8OfAl6ZlvYtd1RmAKvI1V9RpcX+Ed
         z85Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYNKGDyYY0U0Xk0OAln+RGBtTNHu2EdNEqGGLelWWLCVKlzTi2EcGGP8uA/9SMdEiX3HPef64pmFHOPOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyj05dlcq1/+d+oCnsxQO6w/UT3yv/azayt4r+binM0nT4edEp
	7nX2eitNGie3fWHcGPxuIuLOYWoA6u27+L7UPpXYDO7iStuGiX00+8GBBzRMabJj2fCkU2Rx3G0
	CvpmIGRORGrvPg5xwb6G8y50hIaCzuJw=
X-Gm-Gg: ASbGncsB6Re0e3EF2ItGRYbU42XY8GxDsuPZR48Li6MVSIbNRYJI8xqGDejI0FF5VOw
	kZVEM/u5A2v0cO6U/eAAp2m8htFmwvNT1XKmFOiECa5FcwF5QYnItwjnYUzAwRRntRi9y6b62zQ
	IR4Fx58zQ15ukbfsMCwnIbCx5uCsX+wlB5ZblKwKNwiEWUUWDsF3jQ90yzqPFBYup6NZUy/7q+w
	jwc7CdvjPwyzKgP0RnRW+IfQ/PDBPZktO9ptstVi6OyfHmJU0KqacCP3uKH8D0h8i3gK8vSvGEy
	nJk9WiKAtwRwqTQTXw==
X-Google-Smtp-Source: AGHT+IEZ+DZIZJ1CWo7CsrWyrGXK9IS7GuBDjbaYE1wEOR4WP9a33jOKRpIRTU18adKB6jZVbBnCpfWYdpXo5X0p0xo=
X-Received: by 2002:a05:6602:3fc7:b0:945:aa01:bab7 with SMTP id
 ca18e2360f4ac-945bb350edemr148478139f.5.1761597695479; Mon, 27 Oct 2025
 13:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162> <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
In-Reply-To: <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 27 Oct 2025 21:41:25 +0100
X-Gm-Features: AWmQ_bkzaHhB9CkmlReafi23CmCyQOI92OWB-Z9nDZJfXxx_hcQyxHwdSOVafLc
Message-ID: <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 27 Oct 2025 at 20:35, Eugene Shalygin <eugene.shalygin@gmail.com> wrote:
> Neither the patch nor 6.18-rc3 work. I'm going to try to revert
> 5b5cdb1fe434e8adc97d5037e6d05dd386c4c4c6 together with anything that
> is needed to apply the reversing patch.

Replacing CONFIG_KERNEL_ZSTD with  CONFIG_KERNEL_GZIP made the kernel
bootable. What does that mean?

Cheers,
Eugene

