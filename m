Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFE73497A6
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 18:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCYRLL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 13:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhCYRKr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 13:10:47 -0400
X-Greylist: delayed 181 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 Mar 2021 10:10:46 PDT
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:400:300::c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD09EC06174A;
        Thu, 25 Mar 2021 10:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616692062; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ABnKtY4SgJLBp0t2wNPi6wiIin8kzXGN1Aepm0DvfEiNvFANpFJ1YLZuhvXmSPUNtW
    1tZoGT04KzDJdJTyClBOJO2dKxOnmBaN7mx+DiyKvNPs2/eoTzIdMAi5Fu3bFS5Rqomr
    HX89oi1m5gMCYOeGZEavTFEXzfb9lEpDHbEiqviuWvMkHzgBs4xSOJVqUIQAvqar6Nd/
    WL/Dh5Oc/aINhsz0ATVZnoH0naPclK88xnRMCRZhoHRmKnaa5Ifiyy0QfYc6wAqlmCCY
    eQYWB1d7sg3bJ7gKO0MNKGeD8a5CVYz6Y8eDjrgPyPUXdPHs11uNgWwLbtTbSASer+rb
    QPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1616692062;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=r5ZSvgWelhvmv8A0aubPMxWALVAcFj7007aM0qTLNJI=;
    b=XnlKj8dJc5OHpM8uwDZf+4cKXNZD178hF+C71mOLNvXc34c4aGiNod5mJg6sbgifID
    UFTyEI3pIyuSg/1L2Y8WC5f479nbOTFs7CF9ZNG+fHjRPVqGjuHcLDCg3dc/lcux2PIh
    6dAs9rf7kDR9hTnWKHTjqDU3F/rxizlKWpGBp0xw9tbTiQnauuCXNsduoeZ8pP8TMCJK
    X2rhcxpsGzMgnT8CTePYFmC0QhqjtvYzZ5n7GtaUuXUvLAK/GdVOopFTCw9sz7BzcE+4
    DOcxArXBlCpUi6nDaO9uMF/e3NPPMQJxMuNZjaCoEQtLsQWhwRteoMaB2vBkLViiYtxm
    IAHA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1616692062;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=r5ZSvgWelhvmv8A0aubPMxWALVAcFj7007aM0qTLNJI=;
    b=cTmhGfSv5h/WGWnUrdCK70hU5K+3MDN/TckKR5fKSdaiWesOVGkQ3SzKVp9Vbpl8wc
    C3YPX4M9EVAEL72Pqh2hdwE6UBPx6T0FNQ1L1kH5HBpLwwRWhnobTkYV/drtFU1SQ/92
    GQyk9E0TCp1wrmvk6psKN9sk/TQvXGV3BfvrjdHYT+0IfM6F98Y/cyHs0HF+rmsl6HRv
    5AOibJtxl9/MdVdEl408AdI30XWE3ckgHafR6So/mkghq0m/EyXaI0A0ObtEtf09Z8x1
    5Otvz6C5c7Sd+ct6bAuOUA7s4ixcFpWuKs8lSNVOD+f3spmok6p4gvK/0Ui3tJ+FN72N
    O8Zg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWOOX"
X-RZG-CLASS-ID: mo00
Received: from sender
    by smtp.strato.de (RZmta 47.22.0 SBL|AUTH)
    with ESMTPSA id 204541x2PH7g6aj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 25 Mar 2021 18:07:42 +0100 (CET)
Date:   Thu, 25 Mar 2021 18:07:35 +0100
From:   Olaf Hering <olaf@aepfle.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: enforce -Werror=unused-result
Message-ID: <20210325180735.1f0238f1.olaf@aepfle.de>
In-Reply-To: <CAK7LNARPs97+eQKMop9cYCs=D4Kwsf_5pq-614OUxT2iZptueg@mail.gmail.com>
References: <20210319143231.25500-1-olaf@aepfle.de>
        <20210325121606.6a2e4e00.olaf@aepfle.de>
        <CAK7LNARPs97+eQKMop9cYCs=D4Kwsf_5pq-614OUxT2iZptueg@mail.gmail.com>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/THhS=xLIoXFdEevs0zr=7pO"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/THhS=xLIoXFdEevs0zr=7pO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 26 Mar 2021 01:55:41 +0900
schrieb Masahiro Yamada <masahiroy@kernel.org>:

> What about  drivers/net/ethernet/lantiq_etop.c  ?

Nothing complained about it. I guess there is a build-bot for alpha, but no=
ne for mips.

> I got a lot of complaints in the last trial.

Why did you get complains, instead of me?


What is the "must" in "__must_check" worth if it is not enforced...

Olaf

--Sig_/THhS=xLIoXFdEevs0zr=7pO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmBcw1cACgkQ86SN7mm1
DoBOzg/+P9vc+QeIlK4gl+sXSe6SCkMrgqnYyRF91gRnjudjMhNeraDjIn7JTQ83
yybXJjPOitBrfEDyEi9+6sBTuPX1UjXNYonqS8nFH/fUTru+sZA5y6lY1ms2ZViu
4DXUN01+LWHX7LFPyLfJKtGN7OXNuiieO+qLX+v84PpEDOJL2BrJ05qd7lqGpp9P
+dR589PtbD+eYL0H+KJFQ7QAchTPoCgBIYGE0uGaCbl6MqggvdJ+mscBX5iURJXy
dX4E+NlLhdLE8D6/Ygy3PryA8f5Phpz0/fdzOscv/BLpnZkBafEVxt+MiPDdsR7h
Nin9LED5iR9FNlUOfMidbEdpzlFYuzciSeun+02uxTyolRE712u92Vn2GBImkoxg
zMxWz1YWhuVuR2k5PWORiBtEqhHi8wBQqRWXT1adu5CfcA/3wbfFR0p/mbb5BADe
QY3ECsOltYVHWOH40FXbFSBRQkVPjTNGnET+WIte0F9nktUUWTTKPhIs50h+KjdW
S0nQCYvMdJn+PlBnIOohu+foEza9QYJ+A44kbk8ENdtG0P5qdZp/1o83zRhOSCka
KJCVqPZ52eVXwjwme2nyAITi901VIpyKe4DRHzj4yT/Mjefkk9zlMCzWB4NuNMQs
ghda5T3lDSBk5/kQhToYtUOZMxG13vQT3h+Fe+sIYEsQd3sG73w=
=Wbk8
-----END PGP SIGNATURE-----

--Sig_/THhS=xLIoXFdEevs0zr=7pO--
