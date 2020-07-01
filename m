Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB13210FB5
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 17:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731842AbgGAPue (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 11:50:34 -0400
Received: from sonic314-19.consmr.mail.gq1.yahoo.com ([98.137.69.82]:43730
        "EHLO sonic314-19.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731638AbgGAPue (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1593618633; bh=R5EdgnehZaIlYM8EBPA/vlDhBKIThSGmN4i2/1YN62k=; h=Date:From:To:Cc:Subject:In-Reply-To:References:From:Subject; b=FvVOnHAN8bAvsJPvtXWz6Js8+X5IvcxO2HCuhgKGFI2sVqb5VJSlF+eg5uTfC0teesogeSYYNxHDTmIbYabxJxVe4W1nQJhLEwTzTvJ16BL8mnRbXADRM9PXiYBbQxDMloiupnu8+5K4qN2YGMlp7enpfxNYcnM0NA2OA7RfJ8pwYbcaGgxQWOrJicG+BnpRXNukSRuNy+wE2TIVH4+MsVCWYrcYEBhOvNluUWzl/QXOMEdjFkX2097wD6+25kAMNNn5w0caCnI/e7apFiHq2mxMAU0qOPg23zJE4bhhNSQs3dsErVx86YkDrx0Jp0qPLwxnRjC5mMOb86kTmdfyJw==
X-YMail-OSG: WY9rcpUVM1matKAkYphaAT_vliUhz2vNSyt2r.xdV8D2sMhv9KJwcSfgFsDcx1Q
 O6pnPZ3d9NbH.PDL6CZOlC1..tWluuPepkphnTTtoHFFukoK1EtGHUNSV0ZU9PfOKaAu3TW1RrYZ
 cVdwezfG.klNgsvND7vSXMkchvACiiL9wOahSGwT3fbos1rIFA52oDo1bQMFJu9klnQfY.pibjNs
 c.Rjgu16PjSOLoZeiU.3cZ47SjeJPJkdrF7oNRsG.ziMOAQilFJtLqRlN1.QUK.adKdPGBMvrrhg
 B9GeFHDOdIuLjuWLKEsK0MkwwD.zbKzaTtJFdw7eS_Rse089j0_p8iFFUqbivWHxPcPSmOw38Ivn
 Y7VlR.jQaM785UgtM_eymaHofjW_IybQqzSjetoCWyen_22MqHgv10Vy1_bBW0zCVrnZxGnEVXPK
 26xQTeinXK5aeEXPXIU5nhNOEfZlPgp0B8NbxPNBeEA4K8f8fcKCa4Sxgta9vH5mefTKxMCXHEsf
 orJWV65QWBqMZ93ZK70UdG1yi7U8eLBcwTAQpz5kMf3NfP1FL3wgVXYoL1FDQRNcp5ABNKjZqLIu
 nUCrzAR8vQwl1DwwAX1p.DnMuwUzEAcdHzUNd6Y18hHhCPLBM4rJ8bqLxEpGUpFhv9rMI0L07Vae
 MWfgXUoO3DB0fgfH9kpMzAdHlshpQwNJUWAbaqmkndyxHvteZkfu7V4y2PlR_CcP5K41NzxQLJhx
 q5aUbzFb9vza6ui7eXDKinkzi.7RRDVcw3IwlMpS4SCJTsZAkl9EW6.IPvxKaehHMV275CSI8SRC
 wpLFxIUiMm60vNDOwbHElb149LGjR4CTYEVJ4fd55SNa460J8XilquJ2GuP6AzsIDvxNkMAkz7cp
 ELXsCdK4CRtL2OSO3vO_Mx3MpdsBTG07UoUpWS4UA9ktdIk5_OKLmt68hEwsvkx9vC7JxEDq.dxg
 TaLWuaT2JWnVXxkqsN9YGCfdgT3fr3nTIg2AgMWAVzI1SnlZ2l83cUR1mXqE61QppMviB7Hae6ya
 pb8GjjE8bjH04Rb5zgpmRUrtAzaOjDQxc0V2hcPZfw4iAYbCwR4Rk2uBLZHm0BR9VL8oVglK2EzC
 ld0Htls_OeNRrjQUtAF9AMr4ZzPum4O317sESQ_O1eYZngPx6GRXf3aIcF2IekxUF2_oK4wC6wsf
 lmLmFf17d_pX9qBuDrVAFIjAAfIw2Z0KZQx0xaSgu4_KARKy.5c949hHj3RrdxYCypW2nMWNFoWy
 T4g9.o.2FX5ZFu3GNROAF9Lb_FFHxUhx7hOBA_sExvHFf1WHjUvX5p7PMJFjIldrcevBQQvWLUMR
 9xyEd_oiq2AHbVzAjWb89h7OL8OnBm7GfL8iH_AJsDT1lT.uwsum48NYSPZ0.CbD4J8d.GaNSCsq
 OZF_wzILo9.sO9MUhbVLP6HaPdwCeYMZkag--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 1 Jul 2020 15:50:33 +0000
Received: by smtp415.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 9236ef3beededec92ee024faf27b2091;
          Wed, 01 Jul 2020 15:50:27 +0000 (UTC)
Date:   Wed, 1 Jul 2020 23:50:05 +0800
From:   Gao Xiang <hsiangkao@aol.com>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     linux-kernel@vger.kernel.org,
        Nick Terrell <nickrterrell@gmail.com>,
        Nick Terrell <terrelln@fb.com>,
        Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: Kernel compression benchmarks
Message-ID: <20200701153028.GA30962@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588791882.08g1378g67.none@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
References: <20200701153028.GA30962.ref@hsiangkao-HP-ZHAN-66-Pro-G1>
X-Mailer: WebService/1.1.16197 hermes_aol Apache-HttpAsyncClient/4.1.4 (Java/11.0.7)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alex,

(sorry... maybe my @gmx.com email is broken again...)

On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> 
> My conclusions:
> 
> - zstd is an improvement on almost all metrics.
> - bzip2 and lzma should be removed post-haste.

I'm some familar with LZ4 and LZMA (xz) internals.

I'd like to add some notes from the principle perspective,
but I'm not sure if I would join some further topic
about this...

 XZ is another form of LZMA2, which is based on LZMA.
 It uses range coder technology. In principle, it has better
 compession ratio with slowest speed (due to multiplication
 by bits rather than lookup table). Instead, Zstd uses huffman
 (which is much like deflate, aka. gzip) and FSE (If I'm not
  wrong about Zstd)...

 So in general (apart from the specific implementation),
 the decompression speed vs compression ratio ralationship are
  LZ4  -  Zstd  -  LZMA

 Some arguments such as compression level have impact on
 LZ matchfinder (yeah, except for bzip2, all algorithms
 are LZ-based) and dictionary size. And some specific
 compressors aren't well-optimized (e.g. zlib).

 Anyway, I think LZMA (xz) is still useful and which is more
 friendly to fixed-sized output compression than Zstd yet (But
 yeah, I'm not familar with all ZSTD internals. I will dig
 into that if I've more extra time).

> - lzo should be removed once zstd is merged.
> - compression level is important to consider for compression speed: the 
>   default lz4 -1 compresses very fast but has a very poor compression 
>   ratio. zstd -19 compresses barely better than zstd -18, but takes 
>   significantly longer to compress.
> - compression level should be configurable: lz4 -1 is useful, but so is 
>   lz4 -9. zstd -1 is useful, but so is zstd -19. zstd -1 is useful for 
>   developers who want kernel builds as fast as possible, zstd -19 for 
>   everybody else.
> - gzip is by far not the fastest compressor (even excluding cat)
> - modern compressors (xz, lz4, zstd) decompress about as fast for each 
>   compression level, only requiring more memory

 lz4 has fixed sliding window (dictionary, 64k), so it won't
 require more memory among different compression level when
 decompressing.

Thanks,
Gao Xiang


