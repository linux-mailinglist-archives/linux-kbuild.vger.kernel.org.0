Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC0A114D42
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2019 09:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfLFIKn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Dec 2019 03:10:43 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:45805 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfLFIKn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 03:10:43 -0500
Received: by mail-pj1-f65.google.com with SMTP id r11so2412069pjp.12;
        Fri, 06 Dec 2019 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C1UE8dpxmbMCTvXIK4iZw65YiC8lrgI7y3O+kpqnJKM=;
        b=EokTTUjHKXuUFWclSh+eqpOTCZZ6jVwb1e3UWinw3vGTYKuvW46UP99DzrRbnAtIF2
         Gbv3+yDv1S6TKXGtmZMjZ9kDLDIsRxtfDdrQ0BRrRmhhcBC6hy58d50swXHS482KXTFe
         5AUkweroQhK2nUZeuRjg2BSIk+rzUuDcVXUJriC1U5H/GvteYZ0TMfzU51BT2EAa3gzg
         4e6rOY71ADOM9oZcQSyYNOVzT1V51Pwpf54cpY/6zZh1Gf0P3t5jQDRO+XHTvIFH5/mp
         s5C3LgUvth2CXOGO1aBgV+40rFWEKTgprNbPDJlocVRDyGfuIB91qTkRz2U2+zn9rVr5
         rT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=C1UE8dpxmbMCTvXIK4iZw65YiC8lrgI7y3O+kpqnJKM=;
        b=rD+4omx05JrUgdnuCy1Qg49L5TgElf1qHzuhIQ0smCjW9z0UPlS4L0UM8AOtVeknqV
         74t7h14HeQCqEsoEtXULvLtfJmGT62U8iUhOusQPRbLeG+rQEb05rVsb1KACio0OXWdU
         U5DE3aZ6p/ST0zWuvIqmY6m8eGj93abe7MehrZbJ/ywIw/opo4zlc05bExMI6MAMuZiK
         uW/3OUy4t3cmg+3kAl7GiqjFAcxhP7rOtS64X+qKFKi2oqsLrp1YiDikmylEuM3FLyjK
         DsqEeHAna3wDKpVQ0aPOodQ1WcGDegt9ADk731HHD4H0jwPw+3oEkNdTT7zZ4m7Hh3ee
         hVSg==
X-Gm-Message-State: APjAAAVUResvDlGBOq+XjAyRf961vbwYZgkbvvGJSBrj08GqgU+BVjXn
        8VgP4r377f/8f8DfdCmKidc=
X-Google-Smtp-Source: APXvYqxH5fNfj16ZBr2+7TU0If7d/yWkIH9rk7fjW7ds2lUiymvcKmlSwlwPwWj1wtqUP0SPtqgpKw==
X-Received: by 2002:a17:902:7207:: with SMTP id ba7mr13594976plb.254.1575619842473;
        Fri, 06 Dec 2019 00:10:42 -0800 (PST)
Received: from ArchLinux ([103.231.90.172])
        by smtp.gmail.com with ESMTPSA id f18sm15401079pfk.124.2019.12.06.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 00:10:40 -0800 (PST)
Date:   Fri, 6 Dec 2019 13:40:27 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     dsterba@suse.cz, Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191206081027.GA1165@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>, dsterba@suse.cz,
        Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204150728.GD2734@twin.jikos.cz>
 <20191205032503.GA3981@debian>
 <CAK7LNARdOGfvc_8TMX+KbJQ1DRGy8_xZsdDye1ZrvimSS1VoFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <CAK7LNARdOGfvc_8TMX+KbJQ1DRGy8_xZsdDye1ZrvimSS1VoFQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01:08 Fri 06 Dec 2019, Masahiro Yamada wrote:
>   On Thu, Dec 5, 2019 at 12:25 PM Bhaskar Chowdhury
>   <[1]unixbhaskar@gmail.com> wrote:
>
>     On 16:07 Wed 04 Dec 2019, David Sterba wrote:
>     >On Wed, Dec 04, 2019 at 12:10:25PM +0900, Masahiro Yamada wrote:
>     >> On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury
>     <[2]unixbhaskar@gmail.com> wrote:
>     >> > +awk '{print $1}' "/proc/modules" | xargs modinfo | awk
>     '/^(filename|desc|depends)/'
>     >>
>     >> I want to see a good reason (e.g. useful for other developers)
>     for upstreaming.
>     >> This script looks like your custom script, which you can maintain
>     locally.
>     >
>     >I think the verbosity should be added to either lsmod or modinfo,
>     not
>     >some script in kernel git.
>     lsmod and modinfo already are pretty verbose and the one liner is
>     using
>     one of them to cut thing out of it....can you give it another
>     look???
>     Moreover,this is sort and precise and can be parsed by other
>     scripts.
>     The whole point behind this is to give the developers a convenient
>     point
>     without going through all the rigorous details.
>
>   lsmod and modinfo are good.
>   If you are not satisfied with the current format,
>   talk to the kmod maintainer.
>   As a maintainer, I need to avoid the situation
>   where upstream tree is flooded with weird scripts like this.
>   One more thing:
>   Despite advice from Randy over again,
>   you are still not able to submit a patch correctly.
>   (see what you sent as v2).
>   Do not get me wrong. I am not saying you to send v3.
>   I do not like this patch. Please stop.
>   --
I completely get you. I should stop sending this. Thanks for the heads
up.=20

And I was not denying the verbosity of lsmod and modinfo , as I was
pointing out to someone else.

About the V2, this was a mistake , I know once I saw it alas! after
sending it you. So, my apology.=20

One thing get it straight , I am NOT trying to flooding with some airy
fairy script , I know what it takes to maintain that bloody thing.

Your time is precious like mine, never try to gobbles it by sending
garbage.

I was thinking make it easy for others, not sure why you think it's
wired.

Again , thanks for the heads up...above statements are STRICTLY NOT in my
defence not to cover the mistake.

>   Best Regards
>   Masahiro Yamada
>
>References
>
>   1. mailto:unixbhaskar@gmail.com
>   2. mailto:unixbhaskar@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3qDO8ACgkQsjqdtxFL
KRX92QgAjHkoScuG/jGzDUGWVxlstQ/vqjht3c4mVgIpuTQlEnd9GtpLRS6SWsn3
mPlrmdVxYpOWUhdRekIfwPQ3I0bcY/teccY04VkoYqvzCq/UGy0xr72fpUrCkN+m
8nVXztrMDgo5MEiLEmFrpnGIsSPJcOGOekWCotFVu+m14dPPOGzWSTVYm1rCppSn
PZYrHyiJds0dEM93SH1ruLbqQZvbvMt0jXVa3SBARoknRSBQKs2LdEpZCvi+7gJz
dior+esWl0a4ajcWXk0MKyjaDPH/LGTI0m12AwA6Ortkr+h73yccxqt2OvcbOHj/
k4t+Bd44GVymXe/JBKeiPT5vI1Ozlw==
=4dLL
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
