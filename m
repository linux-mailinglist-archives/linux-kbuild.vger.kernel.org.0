Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E411CC64C
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 05:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEJDtj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 May 2020 23:49:39 -0400
Received: from bluehome.net ([96.66.250.149]:54824 "EHLO bluehome.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgEJDtj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 23:49:39 -0400
Received: from pc (pc.lan [10.0.0.51])
        by bluehome.net (Postfix) with ESMTPSA id 4CE824B400B7
        for <linux-kbuild@vger.kernel.org>; Sat,  9 May 2020 20:49:39 -0700 (PDT)
Date:   Sat, 9 May 2020 20:49:37 -0700
From:   Jason Self <j@jxself.org>
To:     linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] make builddeb invoke calls to linux-update-symlink
Message-ID: <20200509204937.5d2e3237@pc>
In-Reply-To: <20200510032539.773-1-j@jxself.org>
References: <20200510032539.773-1-j@jxself.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/eF3YnNRTUEhBmsMkz.R6pqE"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/eF3YnNRTUEhBmsMkz.R6pqE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

My apologies. I realized this patch is incomplete. It should also be
invoking linux-update-symlinks as part of postrm as well. I will
re-send this. My apologies for the added noise.

--Sig_/eF3YnNRTUEhBmsMkz.R6pqE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJet3nSAAoJEJ0NsxtUWjGYjrsP/jAXPhr8KnznsH8/D1DIyLKV
bdKujNSw+0yXF1RzMMFSuyVOOEbat63iXHBxRStodEx6exzgYd4NRMwJZs8j5ma5
4nRaNxO0pa7Q6CooZEucLZQlQerqXwWsPHvQID3MSKDDgzljJu8miYly6OskZntD
/k2CnAFqik8Gxo/e2Sm5AG/AgXmNAJ1ZJzEKgAN4+HoALSxZMTIWjd33DmWG+9/b
Httl/bq1LZWjqkKeVgJvnP8bAkjqGLuwj1cM9ygUmhT1BYjW4oh6wluXdJlyQS8z
Wc/f+pc3003Jh00s4Gt95or4lgIj2i1eGtq7gxJ9x/P3g+jrtcMubx1aRwgcWQdH
gvdvcDuUOquQ9sqTbJ/HNVeVNFMSl9qfbKN5nbKbnC5K9PEBSkxV+HvZnh6x1tX1
a33Q+t4Cp2SpqM256QCfZd1q/ixVcTppYSmiVtiUJbi75REa8Lr7mzfBcPhx0Z2j
D36QAXHO+MCcMkfgZ5wVz9sjVPcHYjjFI0fkLxvdDx/RT4ULCmEt9ysr3RMmYtv5
Ep6nKl6PUd5SUqFpk3I81nL1yZjn9vQP2aUaFpIl4YCFfJNk4QfXpeLSh6qNCzFR
3bLJXa7IFPC4U8AZElqN//DmXEgPOHUdeB3c2P/BF8JBBaH9NdxSGu4kTPGS8Ln4
TKYYWsduy9btyHxewkBa
=Ovk5
-----END PGP SIGNATURE-----

--Sig_/eF3YnNRTUEhBmsMkz.R6pqE--
