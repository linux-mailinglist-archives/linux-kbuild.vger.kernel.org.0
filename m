Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F051B02D1
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 19:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbfIKRlg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 13:41:36 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34374 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbfIKRlg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 13:41:36 -0400
Received: by mail-qk1-f193.google.com with SMTP id q203so21657132qke.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2019 10:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=25JRBoGwbNqZ8ZbbR+1c/cAOmRYTY0r1W7kYmacXxVo=;
        b=WrMnaL3Xuka4oZaXmJIo2WSIwuL2P1+DUFq3nOHLuWVF/+2jQl5Oee0dLhKstwt6sg
         3K3NBriWe2s0xVrhqJpY48vzHy+845CJCkLYXOu4bL/KxHAkVKOsq/Ah4vrFoF/e5hov
         iTYSMYKKVFK63FjFMfShG5O/82tioYFSSYbxsvI6fI/XdRZkpaMGwh3ctaApfURzvupt
         ksmy7yBuJSZJHNpK+ZULajI4JeNGpafSCmvbvgIix4BKrUk4LhAlwfpCLJ5niyiTLkXm
         SfmVe2Io4WLDlBBjXb+izlbIEb7XKmRRhllJco/fpw8nL69/VUrhskbaKyFmaEpopfh/
         NfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=25JRBoGwbNqZ8ZbbR+1c/cAOmRYTY0r1W7kYmacXxVo=;
        b=jEPVLeIAiJ6oc6wxwtw9JswrfCUtmF8BpaxkDoagGyAqHkE/CmcGujCm0sKvjT91QL
         j663TcQZ8mJcFb3wb+BPDMfDnndrUxgfD8aCO3wKwBJe0QyR0SutkSPgCEBV+whc3j45
         WnAK3MsK2EwKBIXFIz8IcqWKat7qEkKPXFk6oQ8k3EwztHEUMgfVXhyiX2JUP0EJZteq
         XXVmz9FTylB1Gx8UXwRb2NClZhZufQzs1Qgy86J3iWwCtTB/fsnFRTtU43IopYOuOWhN
         WZO5WISrcSyjiJMMwZZTeSd5kXUAe7/0DH60UzWReMv/6KJGGapuJ6AVSPQkxacjaLBr
         M1yg==
X-Gm-Message-State: APjAAAUTFNWqmqjRDr7mWjvfyVfg2sauH5we6v+ETsfPLbM/4aCjLXdU
        hJr8lPC6SehStJ2NJLSEP62tzw==
X-Google-Smtp-Source: APXvYqwRPN13iIetO6Wdur/IeaTIoSzIQ9r9ATrh7EP/53AQPhMtw6dHKFMi/Xdr6uoIk3W9ikvjOg==
X-Received: by 2002:a37:541:: with SMTP id 62mr7007670qkf.371.1568223695653;
        Wed, 11 Sep 2019 10:41:35 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id d127sm10590761qke.54.2019.09.11.10.41.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 10:41:35 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
Date:   Wed, 11 Sep 2019 13:41:33 -0400
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        emil.l.velikov@gmail.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        michal.lkml@markovi.net, mripard@kernel.org, sean@poorly.run,
        yamada.masahiro@socionext.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
References: <20190911173453.958-1-cai@lca.pw>
 <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
To:     Maxime Ripard <maxime.ripard@anandra.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Sep 11, 2019, at 1:37 PM, Maxime Ripard <maxime.ripard@anandra.org> =
wrote:
>=20
> Hi,
>=20
> Le mer. 11 sept. 2019 =C3=A0 19:35, Qian Cai <cai@lca.pw> a =C3=A9crit =
:
> The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
> proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=3Dy=

> to always compiling drm/. This restores the behavior, so people don't
> need to waste time compiling stuff they don't need.
>=20
> Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future =
proof.")
>=20
> You are missing your signed-off-by

That is intentional because this is a RFC patch to gather the feedback =
as I am no
expert in DRM and may miss something important.

Once people are happy with it, I plan to send a formal patch with =
Signed-off-by.

