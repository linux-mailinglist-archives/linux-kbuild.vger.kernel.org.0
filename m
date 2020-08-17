Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB1D246597
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 13:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgHQLlW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 07:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgHQLlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 07:41:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB37C061389;
        Mon, 17 Aug 2020 04:41:18 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w25so17051984ljo.12;
        Mon, 17 Aug 2020 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:date:from:to:cc:message-id:in-reply-to:references;
        bh=DSSLi1nehUTQX9TtZXEIyfRv/D0dGZ+iJs4E1Ou7Qcg=;
        b=NideZf0rdtwhnk/2DLL2h/tN4nIJigxAXTwVunWJ/2iZlkC6iYjtZFlYqAiFOkVK3M
         IOjCAjTf+tJ1b7GJxOon5Op8gz1jelr/6ynZs61yhv+0IR1HbPSb9KTCMwretc+uF+rs
         BIlIrb1L3CJYzVoTo+X8HcH9qLJuIVPdG2Rm5Vm4bVZ59oiHYvovRc/vlInvxPMdfbuK
         Z1+JqRY20CrPGwE/R+3FSGfXd26zqbEQAZUf7RCthAbqf5Id+D6sHmJkx3A0JvJFQGHB
         hDI7056ESRegVF0RvZoibRoLBW8FNjrmJnqM3cZfVxlhqGe/wj01RKzBooicgnnwHcwR
         OBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:from:to:cc:message-id:in-reply-to
         :references;
        bh=DSSLi1nehUTQX9TtZXEIyfRv/D0dGZ+iJs4E1Ou7Qcg=;
        b=lIpv32OtSMZ0nlw152khVh901OWp1KbVa4e5tbQBcN2KBFXZnvbEMfZ3pSOD/QEoSZ
         tkRZQZ/043rhj8WX4jY/Vw3Dlx4SrIpXDQILYUcSAvshyKgexTgjD4ObGBsrFJPVgxna
         wkrTeHKMGDNGsUfTxolgViS7Zyj/2FWoyCul1hr/EVlD4+sVRQl4iMj8GqGv4ri9RVt1
         /Pm9WRGrqYjCd9O9X7xJfoE1p7EOMda/G3MKz/yp/2w2ItZhSclV3H2+1LniATXumdBp
         8rE7XzzGlUcJoNBTYiddp+fBoscWQrfYmBQRS6Ik2uWggF7Nvul6IdW1Pg82AqVSesF0
         w5BQ==
X-Gm-Message-State: AOAM533DNBNyjkW146zeFTnaQSMIWIT80ks/OZHkw9hC3OrE2/6U8gqo
        8n9LFNYUb7gXF/rvUqx4iHE=
X-Google-Smtp-Source: ABdhPJwp39koeVrx4TtarDgGWDwWaUuSXr8IRhxum7G4BJWH5Zlqanfj105FthIkqYB0dqD6MPnmTg==
X-Received: by 2002:a2e:71a:: with SMTP id 26mr3343239ljh.198.1597664476777;
        Mon, 17 Aug 2020 04:41:16 -0700 (PDT)
Received: from gmail.com ([217.170.206.146])
        by smtp.gmail.com with ESMTPSA id u5sm5456598lfr.3.2020.08.17.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 04:41:16 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
Date:   Mon, 17 Aug 2020 11:40:00 -0000
From:   Michael Witten <mfwitten@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Message-ID: <04721d8183af49b793952d2d63c72add@gmail.com>
In-Reply-To: <7d0be10602e31e334ff41299c06f537880c55bd0.camel@perches.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
  <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
  <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
  <7d0be10602e31e334ff41299c06f537880c55bd0.camel@perches.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Joe Perches (Sun, 16 Aug 2020 10:56:53 -0700):

> On Mon, 2020-08-17 at 03:37 +0000, Michael Witten wrote:
>> Matters  of style  should  probably not  be enforced  by
>> the  build infrastructure;  style  is a  matter for  the
>> maintainer to enforce:
>
> I rather doubt style advice  should be taken from someone
> who right justifies fixed pitch block text.
>
> cheers, Joe

Clearly, I never offered style advice.

Indeed, the very first sentence I wrote in this thread was:

  > This is not just a matter of style; this is a matter of
  > semantics[.]

Sincerely,
Michael Witten

As an  aside, the  venerable 'man' program  justifies fixed
pitch text, at least by default.
