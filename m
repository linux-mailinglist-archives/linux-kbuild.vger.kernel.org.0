Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C352111FE
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 19:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbgGARdA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 13:33:00 -0400
Received: from sonic317-20.consmr.mail.gq1.yahoo.com ([98.137.66.146]:38967
        "EHLO sonic317-20.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731542AbgGARc7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 13:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1593624778; bh=yg5S/NUNL47YSdgNtROl9qTsDiAs74YW8QyKnvmqWhE=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject; b=XkZQI7SgZevB/HSCapCAKYVp+qq80ltN6uxF+iFMMfhXQgWwqlDapnalgyxdyZC50Y92ZKHHp/RIPv7r1oImhwBIylrt48EC79FcB9UYl+i16V9cgqy5Bf6rv1VzwfgR3ERKxtjg4nDWPvtO50LtwjD4AawH1TUePYRdGTjsEgrp6lubLbreXqs/cWOEpiLU3P64tQV/4RVCc/GFlW8dRVSN7yELyypG9GZMppvvVMI4iDttnQAz2XaTEc9N+dSCoj8jNoTTsgDzXykZdwaHNIfFMTAZ7Z0YmIeZBor1+YN6vnrqecrkwiPjOxMtBNC4fYW7qjOHR1x9TrpMfd9cNQ==
X-YMail-OSG: S51c0tkVM1nAk_e04bLOgEd_oiWPE4YY6Kr6XEbhpwGHsN5aHV.K2a6e53OP1.K
 IIy1VE9lStgoy5Cm8ISrAxRtGk.0GQZillpDJ.ene_Fm9pGsYyHI6yRQVrlVT1sCEPh8GUdwQYgb
 nhON_5d_5Rdk7xrH1GXvnGm_966wekIkNe1_U8Ck2lbmqu8KXor_sNEfwmv.w8Xg_nNcPsZFe0mb
 q4sToCFWSvMBlB159CcUZi0xiO8yp9MHL4aS20Cvsx8JA6VT_ab14i86Yx63767OWWEc5R_3jJj6
 O98p6ijcD14c_DYcnANRASj2TryiyD_DT0i6N48puTItKg0SONiGwrxCtLs.3ftxKya0l3L29VHs
 Y1qPMjSlmf6CY87wji7mObKIZCcuYFSIJGquHcTO9HWABEAdZJ5guksN9Xx1VLfCEfaS_4p2dfqb
 Qis.Ou_kOxce1OMUyi.jFwHHhiuvukqiFlzSLeIsQWoCiw3VOqqg2K.EMi824wFGWv0EcTDQxTUB
 PEljOJDxeyWT1ZCeYel3h_QvQIfBSZaGfYhbI0B.uXcyeU2O4ZSPFFU7mbndGio9tGl3AxuVUYX4
 fBchYZjaoN9yPJ4ipSCvFwqD497AIdNOfzRUlwaSx6MFREiTRktWxCVi4FXcdgIsYGcnz781GueN
 H3U2pe2QqWqFeXe35rlvDmm706Jh5djTxKZV31kAFzLyIFxti22xDT0gGEPik9bCeSnTTybeJbzz
 BaOq__rKI.deYmF6Z_mL5OOuXIOyCCO6_fjJU6iwchbLFwjw3qMbwePGBMKf_Ff2EY4RCZs2VE3q
 kDTwYTmy6sOsvOc5bUbPNPLDTxaSZ2kCRFtbwNlTH6NFgiM.HhkhGrh_v9RfP.nOPCAcsM23kO51
 LvOiqf3AtmEDuxiuFtpaVUE3aDyMJQZoxGSX.sFCu9T.LMHmsx9eFVGQ5zxl38dz1YzYqdvBmX08
 hQyVHAwm4WBQJnhKS2g4l50gNZvBPPCjAkaOXuusOcXqPpRxylz24CQfj2tE5mpefdJvJlz864FI
 ktgBQ2QguFCDB96oHQyzXbA6N0iff_4Iq0ofIfPbDNjoUJ2RX3Pbg8geWoHG3Ctu0NcGYnlXwf56
 9r7.Nmv67ZDger6LRgrRhAY0h3oZbzZNzBo8PSy9xy.B8KYv5E.raNH63wLVHb89FwbrmCuC.1hl
 jZKiUv6lJwNblWRFdCeE0aba25_dk50SmNZBnV3NTtWt.nix91oTFYfi3DdF0flcWs2nCf01_5Vr
 3YEfwVsqHdVEm5zZZ9cmbsHU2Fls8B.SIVaKuaTk044PVOi4tfPJwgrzQKHF1bxxdxJxFA.mtk0v
 LM0KUrTK8GFK8f1Ra1YOoDbDn2NVi39RzeRs8FpF3AKf2B92.RMokHM5vTcVfEJcwrnAmuwrVc_Z
 ooh6xkCdD1O2CIMD3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 1 Jul 2020 17:32:58 +0000
Received: by smtp431.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID db7213753695a442c5a3fafca2fca709;
          Wed, 01 Jul 2020 17:32:55 +0000 (UTC)
Date:   Wed, 01 Jul 2020 13:32:52 -0400
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: Kernel compression benchmarks
To:     Gao Xiang <hsiangkao@aol.com>
Cc:     Chris Mason <clm@fb.com>, gregkh@linuxfoundation.org,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@kernel.org, Nick Terrell <nickrterrell@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Petr Malat <oss@malat.biz>,
        Patrick Williams <patrick@stwcx.xyz>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Terrell <terrelln@fb.com>, x86@kernel.org
References: <20200701153028.GA30962.ref@hsiangkao-HP-ZHAN-66-Pro-G1>
        <20200701153028.GA30962@hsiangkao-HP-ZHAN-66-Pro-G1>
In-Reply-To: <20200701153028.GA30962@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Message-Id: <1593624505.w282woxb43.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16197 hermes_yahoo Apache-HttpAsyncClient/4.1.4 (Java/11.0.7)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Excerpts from Gao Xiang's message of July 1, 2020 11:50 am:
>  Anyway, I think LZMA (xz) is still useful and which is more
>  friendly to fixed-sized output compression than Zstd yet (But
>  yeah, I'm not familar with all ZSTD internals. I will dig
>  into that if I've more extra time).

Yes, I agree. If you look at the graphs, LZMA2 (xz/7zip) still produces=20
smaller results, even compared to zstd maximum settings, so definitely=20
LZMA2 should be kept, at least for now. I am only suggesting removing=20
LZMA, since it has no benefits over xz and zstd combination (bigger than=20
xz, slower than zstd).

>> - modern compressors (xz, lz4, zstd) decompress about as fast for each=20
>>   compression level, only requiring more memory
>=20
>  lz4 has fixed sliding window (dictionary, 64k), so it won't
>  require more memory among different compression level when
>  decompressing.

Yes, this is true. I tried to simplify among all compressors, but I=20
think I simplified too much. Thanks for clarifying.

Cheers,
Alex.
